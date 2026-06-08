#!/usr/bin/env bash
set -euo pipefail

REPO="https://raw.githubusercontent.com/danielpetrica/aibox/main"
INSTALL_DIR="${HOME}/.local/bin"
AIBOX_BIN="${INSTALL_DIR}/aibox"

echo "=============================================="
echo "  aibox installer"
echo "  isolated AI coding sandbox"
echo "=============================================="
echo ""

# ensure install directory exists
mkdir -p "${INSTALL_DIR}"

# download aibox script
echo "Downloading aibox..."
if command -v curl &>/dev/null; then
    curl -fsSL "${REPO}/aibox" -o "${AIBOX_BIN}"
elif command -v wget &>/dev/null; then
    wget -q "${REPO}/aibox" -O "${AIBOX_BIN}"
else
    echo "Error: curl or wget is required. Install one and try again."
    exit 1
fi

chmod +x "${AIBOX_BIN}"
echo "  -> ${AIBOX_BIN}"
echo ""

# ensure ~/.local/bin is in PATH for this session and going forward
if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
    export PATH="${INSTALL_DIR}:${PATH}"
fi

# add to PATH via shell config if not already there
add_to_path() {
    local rc="$1"
    local path_line="export PATH=\"${INSTALL_DIR}:\$PATH\""

    if [[ -f "${rc}" ]]; then
        if ! grep -q "${INSTALL_DIR}" "${rc}" 2>/dev/null; then
            echo "" >> "${rc}"
            echo "# aibox" >> "${rc}"
            echo "${path_line}" >> "${rc}"
        fi
    fi
}

for rc in "${HOME}/.bashrc" "${HOME}/.zshrc" "${HOME}/.profile" "${HOME}/.bash_profile"; do
    add_to_path "${rc}"
done

# run the install wizard
echo "Running setup wizard..."
echo ""
exec "${AIBOX_BIN}" install
