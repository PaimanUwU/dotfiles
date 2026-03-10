🚀 My Personal CLI Cheatsheet

🛠️ Core Aliases & System
| **Alias** | **Command** | **Quick Description** |
| :--- | :--- | :--- |
| **`sourcezsh`** | `source ~/.zshrc` | **Reload** shell config (alias: `reload`) |
| **`zshconfig`** | `nano ~/.zshrc` | **Edit** your config file |
| **`h`** | `cd ~` | **Home** sweet home |
| **`c`** | `clear` | **Clear** the screen |
| **`cat`** | `bat` | **Read** with syntax highlighting |
| **`code`** | `codium` | **Edit** in VSCodium |
| **`cheats`** | `bat .../Cheats` | **View** these notes |
| **`myip`** | `curl ifconfig.me` | **Check** public IP address |

---

🧠 Smart Navigation & Files
- **`cd <query>`** → Jump to highest-ranked directory (**zoxide**).
- **`cd <space> <tab>`** → Trigger **fzf** to pick from recent locations.
- **`cdi`** → **Interactive** fuzzy jump (zoxide + fzf).
- **`..`** / **`...`** → Go **up** 1 or 2 levels.
- **`mkcd <dir>`** → **Make** a directory and **enter** it instantly.
- **`y`** → **Yazi** Terminal File Manager (Press `~` for help).
- **`fzf`** → **fzf** Open command line fuzzy finder (Adding `**` any command will open with fzf e.g. `nvim **` ).

---

📂 Modern File Listing (`eza`)
- **`ls`** → **The Clean List**: Icons and Git status; hides permissions/sizes/times.
- **`l`** → **The Detailed List**: Standard `ls -lah` equivalent.
- **`lt`** → **The Tree View**: 1-level deep, groups folders, sorted by extension, ignores `.git`.

---

🐙 Git Productivity
| **Alias** | **Command** | **Action** |
| :--- | :--- | :--- |
| **`gs`** | `git status` | Check status |
| **`ga`** | `git add .` | Stage **all** changes |
| **`gc`** | `git commit -m` | Commit with message |
| **`gp`** | `git push` | Push to remote |
| **`gl`** | `git log --oneline --graph` | Pretty visual history |
| **`gco`** | `git checkout` | Switch branches |

---

💻 Development Environments
- **Docker:**
  - `dps`: Clean table of running containers.
  - `dstop`: Stop **all** running containers at once.
- **Node/JS:**
  - `ni` / `ns`: NPM Install / Start.
  - `rd`: **Nuke** (delete `node_modules` & reinstall).
- **Python:**
  - `py`: Run Python 3.
  - `venv`: Activate local virtual environment.

---

🍺 Homebrew Essentials
- `brew update && brew upgrade` → Update all formulas and casks.
- `brew cleanup` → Remove old versions/cached files.
- `brew info <pkg>` → Check version and dependencies.
