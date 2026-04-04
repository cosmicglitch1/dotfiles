fastfetch

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%(j.%F{yellow} %F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f
❯ '

if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    "$HOME/.tmux/plugins/tpm/bin/install_plugins" &>/dev/null
fi

# if command -v tmux &>/dev/null && [ -n "$ALACRITTY_SOCKET" ] && [ -z "$TMUX" ]; then
#     SESSION="alacritty-$$"

#     tmux new-session -d -s "$SESSION" -c "$PWD"
#     tmux split-window -v -p 30 -t "$SESSION:0"
#     tmux send-keys -t "$SESSION:0.0"
#     tmux select-pane -t "$SESSION:0.1"

#     tmux attach -t "$SESSION" || echo "Failed to attach tmux, continuing..."
#     tmux kill-session -t "$SESSION" 2>/dev/null
# fi

# eval "$(starship init zsh)"
# starship preset gruvbox-rainbow -o ~/.config/starship.toml
# uninstall - sh -c 'rm "$(command -v 'starship')"'

source ~/.extras

alias vim=nvim

alias gitretrack="git rm -r --cached . && git add ."

# git shortcuts
alias gap="git add -p"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gpu="git pull"
alias gck="git checkout"

export PATH="$HOME/compiled/bin:$PATH"
export PATH="/opt/local/libexec/gnubin:$PATH"

export LD_FOR_TARGET=ld
export OBJCOPY_FOR_TARGET=/opt/local/libexec/llvm-16/bin/llvm-objcopy
export OBJDUMP_FOR_TARGET=/opt/local/libexec/llvm-16/bin/llvm-objdump
export READELF_FOR_TARGET=/opt/local/libexec/llvm-16/bin/llvm-readelf

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export PGDATA=/opt/local/var/db/postgresql17/defaultdb
export PATH="/opt/local/lib/postgresql17/bin:$PATH"
export DYLD_LIBRARY_PATH="/opt/local/lib/postgresql17:$DYLD_LIBRARY_PATH"
export LIBPQ_INCLUDE_PATH="/opt/local/include/postgresql17"
export LIBPQ_LIB_PATH="/opt/local/lib/postgresql17"
export PKG_CONFIG_PATH="/opt/local/lib/postgresql17/pkgconfig"

export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:/opt/local/share/pkgconfig"
export CPPFLAGS="-I/opt/local/include"
export LDFLAGS="-L/opt/local/lib"

export PATH="$HOME/Library/Python/3.9/bin:$PATH"

export PNPM_HOME="/Users/decompile/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$PATH:/Users/decompile/.local/bin"
export PATH="$HOME/Library/Python/3.12/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/opt/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
. "/Users/decompile/.deno/env"
