FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    unzip \
    build-essential \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g pnpm yarn bun \
    && rm -rf /root/.npm

RUN curl -fsSL https://raw.githubusercontent.com/Thavarshan/phpvm/main/install.sh | bash

RUN bash -c 'export HOME=/root && source /root/.bashrc 2>/dev/null; \
    echo "$PATH" | grep -q phpvm || export PATH="$HOME/.phpvm/bin:$PATH"; \
    phpvm install 8.5 --default'

RUN npm install -g opencode-ai@latest \
    && rm -rf /root/.npm

RUN npm install -g @openai/codex \
    && rm -rf /root/.npm

RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent \
    && rm -rf /root/.npm

RUN useradd -m -s /bin/bash aibox \
    && echo "aibox ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/aibox

RUN mkdir -p /home/aibox/.local/share/opencode && chown -R aibox:aibox /home/aibox/.local \
    && mkdir -p /workspace && chown aibox:aibox /workspace

USER aibox
WORKDIR /workspace

ENTRYPOINT ["opencode"]
