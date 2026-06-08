# aibox

Isolated AI coding sandbox. Run opencode, Codex CLI, or pi inside a Docker container so your host credentials and filesystem stay safe.

**Bundled tools:** opencode, Codex CLI, pi, Node.js v24, PHP 8.5, bun, pnpm, yarn, git.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/danielpetrica/aibox/main/install.sh | bash
```

The installer downloads `aibox` to `~/.local/bin/`, walks you through setup, and pulls the Docker image.

## Usage

```bash
aibox start              # opencode (default)
aibox start -p "refactor" # opencode with prompt
aibox codex              # OpenAI Codex CLI
aibox pi                 # pi coding agent
aibox shell              # interactive bash shell
aibox run <cmd>          # run any command in the sandbox
```

## Commands

| Command | Description |
|---------|-------------|
| `aibox start [args]` | Run opencode (default tool) |
| `aibox codex [args]` | Run Codex CLI |
| `aibox pi [args]` | Run pi |
| `aibox run <cmd>` | Run any command inside sandbox |
| `aibox shell` | Interactive bash shell |
| `aibox install` | Setup shell alias and preferences |
| `aibox update` | Pull latest Docker image |
| `aibox clean [--image]` | Remove containers (and image) |
| `aibox build` | Build image locally from source |
| `aibox version` | Show version info |

## Security

The container runs as a non-root user. Only the current working directory is mounted. No host credentials, SSH keys, or environment variables are exposed.

During `aibox install` you can opt in to mounting `~/.gitconfig` and `~/.config/opencode`. These are disabled by default.

## Included tools

| Tool | License |
|------|---------|
| opencode | MIT |
| Codex CLI | Apache 2.0 |
| pi | MIT |
| Node.js v24 | MIT |
| PHP 8.5 (phpvm) | MIT |
| bun | MIT |
| pnpm | MIT |
| yarn | BSD-2-Clause |

Claude Code is proprietary and cannot be redistributed. You can install it manually inside the container if needed.

## Update

```bash
aibox update              # pull latest image
```

New versions are published automatically when a git tag is pushed. The `:latest` tag always points to the most recent release.

## Build from source

```bash
git clone https://github.com/danielpetrica/aibox.git
cd aibox
./aibox build
```

## Requirements

- Docker (Docker Desktop on macOS/Windows, docker-ce on Linux)

## License

MIT
