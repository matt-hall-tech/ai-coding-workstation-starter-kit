# Starter Checklist

Use this as your practical worksheet.

Tip: In GitHub files, mark progress by editing `[ ]` to `[x]`. For easier tracking, open this file in Obsidian/VS Code/another Markdown app.

## Phase 1: Discovery

- [ ] Confirm your OS (macOS, Linux, or Windows)
- [ ] Run Prompt A from the full guide
- [ ] Run only read-only discovery commands
- [ ] Save output as `machine-discovery.md`

Reference: [Prompt A](./full-guide.md#prompt-a---hardware-and-system-discovery)

## Phase 2: Architecture Design

- [ ] Run Prompt B with `machine-discovery.md`
- [ ] Confirm recommended architecture class (A/B/C)
- [ ] Confirm folder layout and mount strategy
- [ ] Confirm local LLM plan is skipped/optional/included based on hardware

Reference: [Prompt B](./full-guide.md#prompt-b---safe-llm-workshop-design)

## Phase 3: Baseline Build

- [ ] Choose workspace root path
- [ ] Create folder structure (`repo`, `work-rw`, `drop-ro`, `secrets`, `data`, `logs`)
- [ ] Initialize Git repo
- [ ] Add `.gitignore`
- [ ] Add `.dockerignore` if Docker is used
- [ ] Add `.env.example`
- [ ] Keep live secrets outside repo
- [ ] Set up SSH key and test Git remote access
- [ ] Set up Python and one project-local `.venv`
- [ ] Commit clean baseline

Reference: [First practical implementation checklist](./full-guide.md#first-practical-implementation-checklist)

## Phase 4: First Post-Build Win

- [ ] Store provider key in `../secrets/provider.env`
- [ ] Run one cloud API test call
- [ ] Confirm model response returns successfully
- [ ] Only then add extra services or local model runtime

Reference: [First post-build cloud win](./full-guide.md#first-post-build-cloud-win)

## Optional Upgrades (Later)

- [ ] Add Docker service only when needed
- [ ] Add local runtime only if discovery supports it
- [ ] Add devcontainer if reproducibility becomes important
- [ ] Script setup with `bootstrap.sh`
- [ ] Add second provider only after first workflow is stable

Reference: [Growth paths](./full-guide.md#growth-paths)
