# LLM Workshop Discovery and Design Packet

## Purpose

Use this packet to help a solo technical user set up a safe local machine for CLI-based LLM work.

This is for someone who:

- uses a personal machine
- may be on a laptop, desktop, mini-PC, or workstation
- is comfortable installing software and using a terminal
- may know Git, Docker, or Python a little
- has used web-based LLMs before
- has not yet built a structured local LLM workshop

Goal:

- start with a clean, simple, reproducible base
- get a first practical win quickly
- use cloud CLI tools first
- add local LLM capability only if the hardware supports it well
- keep the system portable, rebuildable, and easy to migrate later

This packet is generic for:

- macOS
- Linux
- Windows

Windows should normally be treated as:

- Windows + WSL2 for Linux-style development workflows
- a workable bridge, not necessarily the final end-state
- if the long-term goal is Linux-native development or server portability, plan to migrate later to a Linux machine or Linux VPS

## Assumptions

This packet assumes the following baseline unless discovery shows a better path:

- Git on the host
- Python on the host
- one project-local `.venv` where Python is needed
- Docker is optional, not mandatory
- Docker should be used only when a service genuinely needs isolation
- cloud CLI tools come first
- local LLM runtime is optional and should only be added if the hardware justifies it
- important data must live in persistent host folders, not only inside containers
- secrets must stay outside the Git repo

## Hardware spectrum note

This packet is written for any personal machine:

- laptop
- desktop tower
- mini-PC
- workstation

Laptop cautions appear often because laptops are a common starting point, but do not assume weak hardware.

Keep these principles:

- [ ] let discovery decide what the machine can actually do
- [ ] do not pre-optimize for weakness
- [ ] do not assume local inference is unrealistic
- [ ] do not assume local inference is a good idea just because it launches

Practical interpretation:

- [ ] on weaker laptops, cloud CLI first is often the cleanest path
- [ ] on stronger desktops or workstations with a capable discrete GPU, local inference may become practical much earlier
- [ ] discovery should determine whether local runtime is:
  - [ ] skipped
  - [ ] optional
  - [ ] practical from day one

---

## Stage model

This packet is designed to be used in stages.

### Baseline

This is the starting point for almost everyone.

- [ ] Native host setup
- [ ] One main workspace root
- [ ] One main Git repo
- [ ] One project-local `.venv` where needed
- [ ] Cloud CLI access working
- [ ] No local model required yet
- [ ] Docker only if a real service needs it

### Next step upgrades

These are sensible improvements after the baseline works.

- [ ] Add Docker for a local database or self-hosted tool
- [ ] Add a devcontainer if you want stronger reproducibility
- [ ] Add better shell bootstrap automation
- [ ] Add a local LLM runtime if discovery shows the machine can run it well
- [ ] Add a second CLI agent or model provider

### Longer-term direction

These are things to work toward, not start with.

- [ ] Capture the setup in a shell bootstrap script
- [ ] Later convert it into Ansible if managing multiple machines
- [ ] Migrate the same structure to a stronger workstation
- [ ] Migrate the same structure to a Linux VPS
- [ ] Split build workspace from heavier local services
- [ ] Add more than one agent provider only after the base workflow is stable

---

## Suggested progression

A simple path for a beginner:

### Phase 1 - first working system

- [ ] Git works
- [ ] SSH key works
- [ ] one repo works
- [ ] `.venv` works
- [ ] one cloud CLI or SDK works
- [ ] one test command succeeds

### Phase 2 - cleaner workflow

- [ ] `.env.example` documents required secrets
- [ ] real secrets stay outside the repo
- [ ] `.gitignore` is correct
- [ ] `.dockerignore` is added if Docker is used
- [ ] folder boundaries are clean
- [ ] backup of the repo exists

### Phase 3 - optional power-ups

- [ ] add Docker for a real local service
- [ ] add a local model runtime if justified
- [ ] add a devcontainer if reproducibility becomes important
- [ ] add a second CLI agent or provider
- [ ] script the bootstrap so the machine is easier to rebuild

---

## How to use this packet

### Stage 1 - discover the machine

- [ ] Paste **Prompt A - Hardware and System Discovery** into an LLM
- [ ] Answer the first question it asks about the operating system
- [ ] Run the exact commands it gives you
- [ ] Paste the command output back into the LLM
- [ ] Save the final result as a Markdown note called `machine-discovery.md`

### Stage 2 - design the workshop

- [ ] Paste **Prompt B - Safe LLM Workshop Design** into an LLM
- [ ] Paste in the contents of `machine-discovery.md`
- [ ] Review the recommended architecture
- [ ] Review the recommended folder layout
- [ ] Review the recommended container strategy
- [ ] Review whether local LLM should be:
  - [ ] skipped
  - [ ] optional
  - [ ] included from day one

### Stage 3 - build the base system

- [ ] Create the bounded workspace root
- [ ] Create the safe folder structure
- [ ] Set up Git
- [ ] Set up SSH key access
- [ ] Set up Python
- [ ] Set up one project-local Python environment
- [ ] Set up one cloud CLI or SDK and test it
- [ ] Commit the clean baseline
- [ ] Only then begin real project work

---

## Core principles

- [ ] Start simple
  Meaning: do not build a complex stack before the basics work.

- [ ] One bounded workspace root
  Meaning: one dedicated top-level folder for this workshop, instead of scattering files across the whole machine.

- [ ] Secrets stay outside the Git repo
  Meaning: API keys, tokens, passwords, and live `.env` files do not belong in version control.

- [ ] Persistent data stays on the host
  Meaning: important code, logs, outputs, and project data must survive container rebuilds.

- [ ] Read-only intake area
  Meaning: keep a folder for source material that tools can read but should not modify.

- [ ] Read-write working area
  Meaning: keep a separate folder where tools are allowed to generate, transform, and save outputs.

- [ ] Docker only when it solves a real problem
  Meaning: use Docker for a service that genuinely needs isolation, such as a database or self-hosted tool. Do not use Docker just for ordinary Python work.

- [ ] Cloud CLI first
  Meaning: the machine should work well even if no local model runtime is installed yet.

- [ ] Local LLM only if justified by hardware
  Meaning: do not force local inference onto unsuitable hardware.

- [ ] One project-local `.venv` per Python project
  Meaning: a `.venv` is a private Python package environment for one project, so packages do not pollute system Python or clash with other projects.

- [ ] Rebuildable and portable by design
  Meaning: the setup should be easy to recreate on another machine later.

- [ ] Automate after the baseline works
  Meaning: first build it manually so you understand it. Then capture it in a shell script or Ansible playbook so it can be reproduced without memory.

---

## Default architecture target

Unless discovery proves otherwise, the default target should be:

- [ ] one safe host workspace root
- [ ] one main Git repo
- [ ] native host workflow first
- [ ] one project-local `.venv` where Python is needed
- [ ] Docker only for isolated services
- [ ] local LLM runtime optional and separate
- [ ] secrets outside the repo
- [ ] read-only and read-write areas clearly separated
- [ ] all mutable app data outside the repo
- [ ] all infra definitions stored as code where practical

---

## Plain-language definitions

### Bounded workspace root

A single folder that contains the entire workshop.

Examples:

- macOS: `/Users/Shared/LLM-Workshop`
- Linux: `/srv/llm-workshop`
- Windows: `C:\LLM-Workshop`
- Windows with WSL2: keep the active Linux-side workspace inside the WSL filesystem

Purpose:

- easier backup
- easier migration
- easier cleanup
- lower risk of tools touching the wrong files

### `.venv`

A `.venv` is a local Python environment inside a project.

Purpose:

- keeps project packages separate from the operating system
- avoids breaking system Python
- makes projects easier to reproduce
- reduces dependency conflicts

### Persistent folder

A folder on the host that survives terminal restarts, app restarts, and container rebuilds.

### Read-only folder

A folder that tools can view but should not change.

### Read-write folder

A folder that tools can safely edit.

---

## Recommended generic folder layout

Choose one stable root and keep it consistent.

### Suggested folders

- [ ] `repo/`
- [ ] `work-rw/`
- [ ] `drop-ro/`
- [ ] `logs/`
- [ ] `data/`
- [ ] `secrets/`
- [ ] `compose/` optional
- [ ] `.devcontainer/` optional
- [ ] `models/` optional
- [ ] `backups/`

### What each folder is for

- [ ] `repo/`
  Main Git repository for docs, scripts, prompts, infrastructure definitions, and code.

- [ ] `work-rw/`
  Safe writable working area.

- [ ] `drop-ro/`
  Read-only input area for source documents, exports, or imported material.

- [ ] `logs/`
  Logs that need to persist.

- [ ] `data/`
  Mutable application data and service volumes.

- [ ] `secrets/`
  Non-versioned secrets, tokens, and environment files.

- [ ] `compose/`
  Docker Compose files for service stacks if Docker is used.

- [ ] `.devcontainer/`
  Devcontainer definition if you later adopt a devcontainer workflow.

- [ ] `models/`
  Optional local model files or local runtime assets.

- [ ] `backups/`
  Backup outputs or exported snapshots.

### Important mount-path note

If `repo/`, `work-rw/`, and `drop-ro/` are sibling folders under the same workspace root, then a Docker Compose file or `devcontainer.json` living inside `repo/` must explicitly mount those sibling folders by relative path.

Example idea:

- from inside `repo/`, the sibling `work-rw/` folder is typically referenced as `../work-rw/`
- the sibling `drop-ro/` folder is typically referenced as `../drop-ro/`

Meaning:

- containers do not automatically see sibling folders
- you must explicitly mount them if you want the container to access them

### Model storage note

Local model files can grow quickly.

Keep these points in mind:

- [ ] keep `models/` outside the repo
- [ ] expect model storage to become large over time
- [ ] do not assume your internal drive will stay comfortable
- [ ] if storage is limited, place `models/` on a larger SSD, NVMe, or external drive

---

## Container strategy options

The LLM should choose one of these after discovery and explain why.

### Option 1 - Native host plus `.venv` plus optional Docker

Use when:

- [ ] the user is working alone on a personal machine
- [ ] they want the simplest starting point
- [ ] they want the fewest moving parts
- [ ] they do not yet need service isolation
- [ ] they want a fast first win

Tradeoff:

- [ ] simplest and best for beginners
- [ ] easiest to understand
- [ ] less isolated than containers
- [ ] more discipline required to keep the host tidy

### Option 2 - Devcontainer plus host Docker

Use when:

- [ ] the user already likes VS Code
- [ ] they want stronger reproducibility
- [ ] they want cleaner separation between host and workspace
- [ ] they are ready for slightly more setup complexity

Tradeoff:

- [ ] stronger reproducibility
- [ ] cleaner boundaries
- [ ] adds a VS Code dependency
- [ ] not the best default for a first solo setup

### Option 3 - Docker-first for everything practical

Use when:

- [ ] strict isolation matters most
- [ ] the user is already comfortable with containers
- [ ] portability and rebuildability are top priorities
- [ ] the machine is strong enough
- [ ] multiple services genuinely need isolation

Tradeoff:

- [ ] most structured
- [ ] heaviest mentally and operationally
- [ ] usually too much for day-one setup

### Default recommendation

- [ ] prefer **Option 1 - Native host plus `.venv` plus optional Docker**
- [ ] move to **Option 2** later if reproducibility becomes important
- [ ] use **Option 3** only when the workload genuinely calls for it

---

## Python strategy notes

Keep the main rule:

- [ ] one `.venv` per real project

Practical exception during early experimentation:

- [ ] one workspace-level helper `.venv` can be acceptable for general CLI or SDK experiments
- [ ] once a project becomes real, give it its own `.venv`
- [ ] do not let a temporary helper `.venv` become a long-term dumping ground

---

## Local LLM runtime strategy

Do not decide this in advance. Decide it after discovery.

### Safe default

- [ ] build for cloud CLI use first
- [ ] keep local LLM optional
- [ ] if local LLM is added, keep it separate from the main coding workspace
- [ ] do not entangle local model runtime with the main repo
- [ ] keep model files and runtime data outside the Git repo

### The decision should be based on

- [ ] RAM
- [ ] GPU type
- [ ] GPU VRAM
- [ ] storage free space
- [ ] thermal and power limits
- [ ] machine class
- [ ] whether the machine can run useful models, not merely boot them

### Apple Silicon note

Apple Silicon machines do not use a traditional dedicated GPU VRAM model in the same way as many other systems.

For Apple Silicon:

- [ ] treat total unified memory as the practical memory budget for local inference
- [ ] remember that the operating system, apps, and model all share that same memory pool
- [ ] evaluate real usability, not theoretical launch capability

### If local inference is practical, pick one starter runtime only

Use one runtime first. Do not install several at once on day one.

Common low-friction starting points:

- [ ] **Ollama**
  Good if you want simple CLI-driven local inference and easy local API access.

- [ ] **LM Studio**
  Good if you prefer a friendlier GUI-first way to browse, download, and test models.

- [ ] **llama.cpp**
  Good if you want a thinner, lower-level tool with more manual control.

Rule:

- [ ] pick one
- [ ] get one simple test inference working
- [ ] only compare other runtimes later if needed

### Practical heuristics for local inference

Keep these as rough starting heuristics, not rigid rules:

- [ ] use discovery to estimate a realistic model size range
- [ ] start with conservative context length
- [ ] context length increases memory use quickly
- [ ] quantized models are usually the practical starting point on personal hardware
- [ ] real usability matters more than theoretical maximum size

What Prompt B should estimate:

- [ ] comfortable local model size range
- [ ] safe starting context length
- [ ] expected trade-offs between speed, quality, and memory
- [ ] whether local inference is genuinely useful on this machine

---

## First practical basics

These are the basics a solo user usually needs immediately.

### SSH key access

- [ ] generate an SSH key pair
- [ ] add the public key to GitHub, GitLab, or Gitea
- [ ] test that Git remote access works before doing more setup

### Secrets documentation pattern

- [ ] keep live secrets outside the repo
- [ ] create a `.env.example` file inside the repo
- [ ] document required variable names in `.env.example`
- [ ] never place real secret values in `.env.example`

### First cloud CLI win

Translate "cloud CLI first" into one simple success path:

- [ ] create an API key with the provider you want to use
- [ ] store the real key outside the repo
- [ ] install the provider CLI or SDK
- [ ] run one simple test command or API call
- [ ] confirm that the machine can successfully talk to the provider before adding complexity

---

## Minimal secrets pattern

A simple starting model:

- [ ] create a `secrets/` folder outside the repo
- [ ] store live secret files there
- [ ] inside the repo, add a `.env.example` file that documents what variables are required
- [ ] never commit live `.env` files
- [ ] add ignore rules so secret files are not tracked by accident

Example idea:

- live file lives outside repo: `../secrets/provider.env`
- inside repo: `.env.example` contains only placeholder variable names and comments

---

## Prompt A - Hardware and System Discovery

Paste this into an LLM.

```text
You are a workstation discovery agent.

Your job is to discover the real machine state before any architecture decisions are made.

Important:

- You cannot run commands yourself.
- You cannot inspect the user's computer automatically.
- You must give the user the commands to run.
- The user must run those commands manually in their own terminal and paste the output back.

Rules:

1. Do not assume the operating system.
2. First ask the user which OS they are using:
   - macOS
   - Linux
   - Windows
3. Once the OS is known, give only the exact commands needed for that OS.
4. Keep commands read-only and safe.
5. Do not recommend software yet.
6. After the user pastes command output back, analyse it and produce a Markdown report.
7. The final report must be practical, concise, and decision-oriented.

You must collect:

- operating system and version
- CPU model
- core and thread count if visible
- RAM size
- GPU model
- GPU VRAM if visible
- storage devices and free space
- whether virtualization looks available
- whether Docker is already installed
- whether Git is already installed
- whether Python is already installed
- whether Node is already installed
- whether the machine is better suited to:
  - cloud CLI only
  - cloud CLI plus optional local LLM
  - serious local LLM use
- likely constraints:
  - low RAM
  - no GPU acceleration
  - weak GPU VRAM
  - thermal limits where relevant
  - limited storage
- a practical summary of what is realistic

Special handling:

- If the machine is Apple Silicon, explicitly identify it as Apple Silicon.
- For Apple Silicon, evaluate total unified memory as the practical memory budget for local inference.
- If the user is on Windows, prefer a Windows plus WSL2 path for Linux-style development workflows, but note that Linux-native development may still be the cleaner long-term target if portability is important.
- If the machine appears to have a strong discrete GPU and generous memory, say so clearly rather than writing from a weak-laptop assumption.

The report should also estimate:

- realistic local model size range
- safe starting context range
- whether local inference is likely to be comfortable, merely possible, or not worthwhile

Output format:

# Machine Discovery Report

## 1. System identity
## 2. Hardware summary
## 3. Developer tooling already present
## 4. Local LLM feasibility
## 5. Recommended architecture class
## 6. Constraints and cautions
## 7. Next input to feed into the design prompt

Important:

- If the machine is weak, say so clearly.
- If local inference is unrealistic, say so clearly.
- If the machine is unusually capable, say so clearly.
- Do not pretend a model is practical if it is not.
- Optimise for a usable system, not a theoretical one.
```

---

## Prompt A - manual command fallback

Use these only if needed.

### macOS

```bash
sw_vers
uname -a
sysctl -n machdep.cpu.brand_string
sysctl hw.memsize
system_profiler SPHardwareDataType
system_profiler SPDisplaysDataType
df -h
which docker || true
docker --version || true
git --version || true
python3 --version || true
node --version || true
```

### Linux

```bash
uname -a
cat /etc/os-release
lscpu
free -h
lsblk
df -h
lspci | grep -Ei 'vga|3d|display' || true
nvidia-smi || true
which docker || true
docker --version || true
git --version || true
python3 --version || true
node --version || true
```

### Windows PowerShell

```powershell
systeminfo
Get-CimInstance Win32_Processor | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors
Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum
Get-CimInstance Win32_VideoController | Select-Object Name,AdapterRAM,DriverVersion
Get-PSDrive -PSProvider FileSystem
docker --version
git --version
python --version
node --version
wsl --status
```

---

## Prompt B - Safe LLM Workshop Design

Paste this into an LLM together with the contents of `machine-discovery.md`.

```text
You are a systems architect designing a safe local workshop for CLI-based LLM work.

You will be given a machine discovery report.

Your job is to produce a practical architecture for that exact machine.

Primary goal:

Build a machine to build machines.

Meaning:

- the base system should be clean, simple, reproducible, safe, and portable
- it should support cloud CLI tools first
- it should support local LLMs only if the hardware genuinely justifies it
- it should be easy to migrate to a stronger machine or VPS later

Rules:

1. Use the discovered hardware as the source of truth.
2. Optimise for real usability, not maximal complexity.
3. Keep secrets outside the repo.
4. Use persistent folders for important data.
5. Separate read-only intake from read-write working areas.
6. Keep service containers separate from the main build workspace.
7. Keep mutable application data outside the Git repo.
8. Explain all recommendations in plain language.
9. If the machine is not suitable for local LLMs, say so clearly.
10. Prefer simple, rebuildable patterns.

You must choose and justify one of these base models:

A. Native host plus project `.venv` plus optional Docker
B. Devcontainer plus host Docker
C. Docker-first for everything practical

You must explain:

- what a bounded workspace root is
- what a `.venv` is
- why a user would choose this base model
- when Docker is actually needed and when it is overkill
- what should live inside the repo
- what should stay outside the repo
- what should be mounted read-only
- what should be mounted read-write
- what should be stored as persistent data
- whether local LLM runtime should be:
  - omitted
  - optional
  - included from day one

You must estimate:

- practical local model size range
- safe starting context range
- whether the machine is better suited to cloud-only, hybrid, or strong local inference
- whether a workspace-level helper `.venv` is acceptable during the experimentation phase

If local inference is practical, suggest one starter runtime only, chosen from examples such as:

- Ollama
- LM Studio
- llama.cpp

Do not encourage installing several runtimes at once on day one.

You must output:

# Safe LLM Workshop Design

## 1. Recommended architecture class
## 2. Why this architecture fits this machine
## 3. Recommended workspace root path
## 4. Recommended folder layout
## 5. Container strategy
## 6. Git and secrets policy
## 7. Python strategy
## 8. Local LLM strategy
## 9. First practical setup steps
## 10. What not to do
## 11. Migration path to a stronger machine or VPS
## 12. First implementation checklist
## 13. Next upgrades to consider later

Constraints:

- assume the user is a solo technical beginner to structured LLM workflows
- do not include custom business apps
- do not include note-taking tools
- do not include project-specific frameworks unless justified
- do not assume huge hardware
- keep the design generic and reusable
- if Apple Silicon is present, explicitly account for unified memory when assessing local LLM viability
- if the machine is a strong desktop or workstation, do not write as if it were a constrained laptop
```

---

## Baseline policy checklist

- [ ] Use one stable top-level workspace root
- [ ] Keep the Git repo focused and clean
- [ ] Keep secrets outside the repo
- [ ] Keep mutable service data outside the repo
- [ ] Keep imported source material in a read-only area where practical
- [ ] Keep generated and transformed work in a read-write area
- [ ] Keep logs persistent
- [ ] Use one clear build environment
- [ ] Use one `.venv` per Python project
- [ ] Use Docker only when a service really needs isolation
- [ ] Add local model runtime only if justified by hardware
- [ ] Commit a clean baseline before adding big services
- [ ] Avoid mixing infrastructure experiments with real project work
- [ ] Capture the setup in a shell script or Ansible later once it is working

---

## What should usually live inside the repo

- [ ] documentation
- [ ] prompts
- [ ] scripts
- [ ] Dockerfiles if Docker is used
- [ ] devcontainer definitions if devcontainers are used
- [ ] compose files if Docker Compose is used
- [ ] sample config templates without secrets
- [ ] `.env.example`
- [ ] `.gitignore`
- [ ] `.dockerignore` if Docker is used
- [ ] requirements files
- [ ] lock files where appropriate

## What should usually stay outside the repo

- [ ] real secrets
- [ ] live `.env` files with credentials
- [ ] service databases
- [ ] model binaries
- [ ] logs that rotate heavily
- [ ] imported source dumps
- [ ] generated output caches
- [ ] large mutable working datasets

---

## What not to do

- [ ] do not dump everything into the home directory
- [ ] do not store secrets in Git
- [ ] do not install random Python packages into system Python
- [ ] do not use Docker just to run ordinary Python work
- [ ] do not mix the coding area with unrelated service stacks
- [ ] do not assume local LLM is a good idea just because it can launch
- [ ] do not build several runtimes or environments in parallel on day one
- [ ] do not keep only one copy of important infra definitions
- [ ] do not let container rebuilds destroy real working data

---

## First practical implementation checklist

- [ ] choose the workspace root path
- [ ] create the folder structure
- [ ] initialise the Git repo
- [ ] create `.gitignore`
- [ ] create `.dockerignore` if Docker is used
- [ ] create `.env.example`
- [ ] create the secrets folder outside version control
- [ ] generate an SSH key pair
- [ ] add the SSH public key to GitHub, GitLab, or Gitea
- [ ] test Git remote access
- [ ] create the read-only intake folder
- [ ] create the read-write working folder
- [ ] create persistent data folders
- [ ] define the base workspace environment
- [ ] create the first `.venv` only where Python is actually needed
- [ ] verify Git
- [ ] verify Python
- [ ] install one cloud CLI or SDK
- [ ] run one test call successfully
- [ ] verify Docker only if a real service needs it
- [ ] commit the clean baseline
- [ ] only then add extra services or local model runtimes

### `.dockerignore` note

If Docker is used, `.dockerignore` helps prevent:

- [ ] huge folders being sent into the Docker build context
- [ ] secret files being accidentally baked into an image
- [ ] slow image builds caused by unnecessary data

---

## Growth paths

These are optional later directions.

### Add a second agent or provider

Examples of the kind of progression a user might choose:

- [ ] start with one provider and one CLI workflow
- [ ] later add another provider if it solves a real need
- [ ] keep the first workflow stable before adding more moving parts

### Add a local model runtime

Only after discovery shows it is practical.

### Add Docker services

Only when a service genuinely benefits from isolation.

### Add a devcontainer

Only when reproducibility becomes worth the extra layer.

### Add automation

Once the base workflow is stable:

- [ ] write a shell bootstrap script
- [ ] later move to Ansible if managing multiple machines

---

## Learning and search topics

Useful things to research once the baseline is working:

- [ ] Python virtual environments for beginners
- [ ] SSH keys GitHub setup
- [ ] `.env.example` best practices
- [ ] `.gitignore` basics
- [ ] `.dockerignore` basics
- [ ] Docker volumes versus bind mounts
- [ ] WSL2 versus Linux for development
- [ ] Apple Silicon local LLM memory limits
- [ ] local LLM quantization basics
- [ ] local LLM context length memory usage
- [ ] Docker Compose for self-hosted tools
- [ ] devcontainers explained simply
- [ ] Ansible for single-machine bootstrap

---

## Recommended send-out instruction

Send this packet with the following instruction:

- [ ] Run Stage 1 first
- [ ] Save the discovery result as Markdown
- [ ] Run Stage 2 second
- [ ] Do not start installing large stacks before the design output is reviewed
- [ ] Start with the baseline and get one practical win first
- [ ] Treat everything else as a later upgrade path, not a day-one requirement
