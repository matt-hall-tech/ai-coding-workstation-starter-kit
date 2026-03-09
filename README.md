# AI Coding Workstation Starter Kit

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

A beginner-friendly guide to set up your computer for AI coding in a safe, cloud-first way.

## Who This Is For

- You use macOS, Linux, or Windows
- You can use a terminal, but want a simple setup path
- You want to learn and build without compromising your computer

## Why Use This Kit

Use this kit if you want to:

- set up AI coding tools safely with clear boundaries
- build small AI helpers for real tasks (summaries, extraction, drafting, automations)
- start with cloud APIs first, then add complexity later only if needed
- keep your setup portable so you can rebuild it on another machine
- optionally run more privacy-focused local workflows on your own machine

## Privacy: Cloud vs Local (Simple Version)

- Cloud mode: your prompts/data are sent to a provider API.
- Local mode: inference runs on your own machine.

Both are valid. This kit starts cloud-first for speed, then supports local options when they are practical.

## Voice-to-Text Option (WhisperKit)

`WhisperKit` is an open-source toolkit for running `Whisper` speech-to-text locally (on-device).

In plain terms:

- it turns audio into text
- local use can be more private because audio does not need to leave your machine
- local use does not charge per API call from cloud providers

Money note:

- local Whisper/WhisperKit software is generally free to run
- if you use a hosted transcription API instead, that is usually paid per usage

## Do You Need Docker?

Docker is optional for this starter kit.

Install Docker when you want to run local helper services on your machine, for example:

- a local app database (store project data like users, tasks, notes)
- a local document-search backend for “chat with my files”
- a self-hosted tool you want to run locally

If you are only calling cloud model APIs from Python/CLI, you do not need Docker yet.

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
