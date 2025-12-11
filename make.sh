#!/bin/bash
set -euo pipefail

# ==== Configuration ====
SCRIPT1_FILE="terminal2.applescript"
SCRIPT2_FILE="vscode2.applescript"

APP1_NAME="OpenTerminalHere"
APP2_NAME="OpenVSCodeHere"

APP1="${APP1_NAME}.app"
APP2="${APP2_NAME}.app"

# Installation directory if needed (not currently used)
# INSTALL_DIR="$HOME/Applications"   # or /Applications

# ==== Build ====
echo "Building ${APP1}..."
osacompile -o "${APP1}" "${SCRIPT1_FILE}"

echo "Building ${APP2}..."
osacompile -o "${APP2}" "${SCRIPT2_FILE}"

echo "Done."
echo "Created applications:"
echo "  ${APP1}"
echo "  ${APP2}"

# ==== (Optional) Uncomment below to install ====
# mkdir -p "${INSTALL_DIR}"
# mv -f "${APP1}" "${INSTALL_DIR}/"
# mv -f "${APP2}" "${INSTALL_DIR}/"
# echo "Installed to ${INSTALL_DIR}"
