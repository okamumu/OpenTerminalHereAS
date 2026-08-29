# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A macOS-only utility: three tiny AppleScript apps that open the folder shown in the frontmost Finder window in Terminal (`OpenTerminalHere.app`), VS Code (`OpenVSCodeHere.app`), or Zed (`OpenZedHere.app`). Intended to be dragged into the Finder toolbar (⌘-drag). No package manager, no test suite, no dependencies beyond macOS.

## Build

```sh
sh make.sh          # osacompile all .applescript sources into .app bundles
```

`make.sh` is the whole build system: it runs `osacompile -o <Name>.app <name>.applescript` for each source. To build just one:

```sh
osacompile -o OpenTerminalHere.app terminal2.applescript
```

Built `.app` bundles are gitignored; installation (moving to `~/Applications`) is a commented-out block at the bottom of `make.sh`.

## Architecture

All scripts follow the same two-step shape:

1. Ask Finder for `Finder window 1` and coerce its `target` to an alias, then take the `POSIX path`.
2. `do shell script` to launch the editor at that path.

The launch step is where they differ, and it matters:

- `terminal2.applescript` uses `open -a Terminal.app <path>` — no shell environment needed.
- `vscode2.applescript` and `zed2.applescript` wrap the command in `zsh -lc` so the login shell's PATH is loaded; `do shell script` otherwise runs with a minimal PATH and cannot find `code` / `zed`. This is why the README requires VS Code's "Shell Command: Install 'code' command in PATH" and Zed's "Install CLI".

`zed2.applescript` passes `-n` (`zed -n .`) so the folder opens in a *new* Zed window rather than replacing the current one. Caveat: Zed cannot show the same project in two windows, so invoking this on a folder Zed already has open re-opens that existing workspace instead — which kills the shells running in its terminal panel. `vscode2.applescript` uses plain `code .` (no `-n`).

Always `quoted form of` any path interpolated into a shell string — folder names with spaces are the common case here.

Note the naming mismatch: sources are `terminal2`/`vscode2`/`zed2` while apps are `OpenTerminalHere`/`OpenVSCodeHere`/`OpenZedHere`; the mapping lives in `make.sh`'s configuration block.

## Icons

`Terminal.icns`, `Code.icns`, and `Zed.icns` are shipped for manual application via Finder's Get Info panel (documented in the README). The build does **not** install them into the bundles.

## Testing a change

There is no automated test. Rebuild, then open a Finder window at some folder and run the app (e.g. `open OpenTerminalHere.app`) with that window frontmost. If no Finder window is open, `Finder window 1` errors — that is known behavior.

## Session log

### 2026-08-30

- Added `-n` to the Zed launch (`zed .` → `zed -n .`) in `zed2.applescript` so it opens a new window; rebuilt all three bundles with `sh make.sh`.
- Discovered the caveat above: running it against an already-open Zed project restarts that workspace and closes its terminal panel (a Claude Code session was lost this way; `claude --resume` in that folder recovers the conversation).
- Decided (2026-08-30, later session): keep `-n`. The already-open case stays as the documented caveat above rather than being guarded against — the Zed CLI exposes no window list, so there is no reliable way to detect it.
- Note for next session: `README.md`, `make.sh`, and `.gitignore` show as modified and `CLAUDE.md`, `Zed.icns`, `zed2.applescript` as untracked — the Zed app is not committed yet.

### 2026-08-30 (later session)

- Ran `/init` and rewrote `CLAUDE.md` from scratch, then re-added the Zed material; the file now documents all three apps.
- Confirmed the `zed` CLI is installed (`/usr/local/bin/zed` → `Zed.app/Contents/MacOS/cli`, Zed 1.17.2). Installed via Zed's **Zed > Install CLI**. If it were missing, the alternative was `open -a Zed.app <path>` (no PATH dependency, like the Terminal app) — worth remembering if this is ever distributed to others, since the CLI is a per-user setup step.
- Added the Zed app end to end: `zed2.applescript`, a third build target in `make.sh` (config block, build step, "Created applications" list, and the commented-out install block), `OpenZedHere.app` in `.gitignore`, `Zed.icns` copied from `/Applications/Zed.app/Contents/Resources/`, and a "For OpenZedHere.app" section under README's Prerequisites.
- Verified: `sh make.sh` builds all three bundles cleanly, and the `do shell script` line was exercised directly via `osascript` against a folder with a space in its name (exit 0) — that is the spaces regression test without needing a Finder window.
- Closed the `-n` question: `-n` stays. Source and the built bundle were both already on `zed -n .` (verified with `osadecompile`), so no rebuild was needed. The already-open-project caveat is accepted behavior, not a bug to fix.
- Still uncommitted: `README.md`, `make.sh`, `.gitignore` modified; `CLAUDE.md`, `Zed.icns`, `zed2.applescript` untracked. Nothing has been committed this session.
