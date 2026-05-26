FROM archlinux:latest

ARG UID=1000
ARG GID=1000

# Minimal pacman deps needed to bootstrap yay
RUN pacman -Syu --noconfirm \
    base-devel \
    git \
    sudo \
    && pacman -Scc --noconfirm

# Non-root user matching host UID/GID
RUN groupadd -g $GID nvimuser \
    && useradd -m -u $UID -g $GID -s /bin/bash nvimuser

# Temporary sudo for yay install + package installation
RUN echo 'nvimuser ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/nvimuser
USER nvimuser

# AUR helper
RUN git clone https://aur.archlinux.org/yay-bin.git /tmp/yay \
    && cd /tmp/yay && makepkg -si --noconfirm && rm -rf /tmp/yay

# Install everything via yay
RUN yay -Sy --noconfirm \
    buf \
    chruby \
    curl \
    fzf \
    go \
    golangci-lint \
    libyaml \
    lua-language-server \
    neovim \
    nodejs \
    npm \
    openssh \
    openssl \
    postgresql-libs \
    python \
    python-pip \
    ripgrep \
    ruby-install \
    tig \
    tmate \
    tmux \
    tree-sitter-cli \
    unzip \
    && yay -Scc --noconfirm

# LSP servers via go
RUN go install golang.org/x/tools/gopls@latest \
    && go install github.com/nametake/golangci-lint-langserver@latest

# LSP servers via npm
RUN sudo npm install -g typescript typescript-language-server

# Claude Code CLI
RUN sudo npm install -g @anthropic-ai/claude-code

USER root
RUN rm /etc/sudoers.d/nvimuser
USER nvimuser

# Ensure state directories exist with correct ownership
RUN mkdir -p /home/nvimuser/.local/share/nvim \
             /home/nvimuser/.local/state/nvim \
             /home/nvimuser/.cache/nvim \
    && chown -R nvimuser:nvimuser /home/nvimuser

ENV PATH="/home/nvimuser/go/bin:/usr/local/go/bin:$PATH"
ENV NVIM_CONTAINER=1

# chruby + chruby-auto for per-project ruby version switching
RUN echo 'source /usr/share/chruby/chruby.sh' >> /home/nvimuser/.bashrc \
    && echo 'source /usr/share/chruby/auto.sh' >> /home/nvimuser/.bashrc

WORKDIR /home/nvimuser/work
