# Activate mise (only if it's instaled and on PATH)
if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate bash)"
fi
