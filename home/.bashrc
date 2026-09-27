# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Activate mise (only if it's installed and on PATH)
if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate bash)"
fi

# Added by Toolbox App
export PATH="$PATH:/var/home/sfenton/.local/share/JetBrains/Toolbox/scripts"

# Sandbox opencode only if both srt and opencode exist
if command -v srt >/dev/null 2>&1 && command -v opencode >/dev/null 2>&1; then
    opencode() {
        srt run -- opencode "$@"
    }
fi
