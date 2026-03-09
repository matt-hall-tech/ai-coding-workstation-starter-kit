# AI Coding Workstation Starter Kit

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

A beginner-friendly guide to set up your computer for AI coding in a safe, cloud-first way.

## Who This Is For

- You use macOS, Linux, or Windows
- You can use a terminal, but do not want a complicated setup
- You want a clean system you can rebuild later

## What You Get

- A simple setup path
- A safe folder structure
- Prompts to discover your machine and design the right architecture
- A first post-build cloud API success test

## Start Here (4 Steps)

1. Open the checklist: [docs/checklist.md](./docs/checklist.md)
2. Run discovery with Prompt A: [docs/full-guide.md#prompt-a---hardware-and-system-discovery](./docs/full-guide.md#prompt-a---hardware-and-system-discovery)
3. Run design with Prompt B: [docs/full-guide.md#prompt-b---safe-llm-workshop-design](./docs/full-guide.md#prompt-b---safe-llm-workshop-design)
4. Build your baseline and run one cloud test: [docs/full-guide.md#first-post-build-cloud-win](./docs/full-guide.md#first-post-build-cloud-win)

## Workspace at a Glance

```text
/LLM-Workshop
├── repo/      # clone this repo here
├── work-rw/   # generated editable work
├── drop-ro/   # read-only source inputs
├── secrets/   # live keys and .env files (not in Git)
└── data/      # persistent service/app data
```

## Document Map

- Full guide: [docs/full-guide.md](./docs/full-guide.md)
- Beginner checklist: [docs/checklist.md](./docs/checklist.md)
- Visual folder diagram + mounts: [docs/full-guide.md#visual-layout](./docs/full-guide.md#visual-layout)
- Prompt A command fallback: [docs/full-guide.md#prompt-a---manual-command-fallback](./docs/full-guide.md#prompt-a---manual-command-fallback)
- Next learning path: [NEXT-STEPS.md](./NEXT-STEPS.md)
- Contribution notes: [CONTRIBUTING.md](./CONTRIBUTING.md)

## Checklist Tip

In repository Markdown files, task boxes are plain text until you edit the file.

- To mark progress in GitHub files, edit `[ ]` to `[x]` and commit
- For easier day-to-day tracking, open [docs/checklist.md](./docs/checklist.md) in Obsidian, VS Code, or another Markdown app
- If you want clickable task boxes on GitHub itself, use Issues or Pull Request task lists

## Repository Structure

```text
.
├── README.md
├── docs/
│   ├── checklist.md
│   └── full-guide.md
├── NEXT-STEPS.md
├── bootstrap.sh
├── CONTRIBUTING.md
├── LICENSE
└── .env.example
```

## License

Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
