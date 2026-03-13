
---

# 🚀 Master Cheat Sheet (2026)

**Prefix Key:** `Ctrl + Space`

## 🛠️ Tmux Keybindings

### 🪟 Panes & Navigation

| Action | Keybinding |
| --- | --- |
| **Split Vertical (Right)** | `Prefix` + `d` |
| **Split Horizontal (Down)** | `Prefix` + `D` |
| **Small Terminal Pane** | `Prefix` + `T` |
| **Navigate** | `Ctrl` + `h/j/k/l` |
| **Resize Pane** | `Prefix` + `H/J/K/L` (Repeatable) |

### 📂 Windows & Sessions

| Action | Keybinding |
| --- | --- |
| **SessionX Switcher** | `Prefix` + `s` |
| **New Session (Prompt)** | `Prefix` + `S` |
| **New Window** | `Prefix` + `W` |
| **Next / Prev Window** | `Prefix` + `n` / `p` |

### 📝 Copy Mode (Vi Style)

| Action | Keybinding |
| --- | --- |
| **Enter Copy Mode** | `Prefix` + `c` |
| **Begin Selection** | `v` |
| **Rectangle Selection** | `Ctrl` + `v` |
| **Yank (Copy)** | `y` |

### 🪄 Plugin Shortcuts

| Plugin | Action | Keybinding |
| --- | --- | --- |
| **Floax** | Toggle floating pane | `Prefix` + `f` |
| **SessionX** | Add Session (in UI) | `Ctrl` + `a` |
|  | Delete Session (in UI) | `Ctrl` + `x` |
|  | Zoxide Mode | `Ctrl` + `z` |

---

## 🐚 ZSH Aliases

| Category | Alias | Action |
| --- | --- | --- |
| **System** | `cheats` | Opens this file |
|  | `ls` / `lt` | List (icons/git) / Tree view |
| **Git** | `gs`/`ga`/`gc`/`gp` | Status/Add/Commit/Push |
| **Dev** | `ni` / `nr` | `npm install` / `npm run` |
|  | `cu` / `ci` | `composer update` / `install` |
| **Utility** | `y` | Launch **Yazi** |
|  | `fk` | Correct last command |

---

## 💡 Pro-Tips for your Setup

* **Copy Mode:** You are now in Vi-mode. Use `Prefix + c` to enter copy mode, navigate with `hjkl`, press `v` to start highlighting, and `y` to copy to your clipboard (supported by your `tmux-yank` plugin).
* **New Window:** Note that you swapped the default window creation key to `Prefix + W`.
* **SessionX Border:** If you don't see the blue border yet, run `tmux kill-server` and start tmux again—sometimes SessionX caches the `fzf` options and needs a full restart to pick up new border color settings.
* **The "Magic" Trigger:** Type `**` followed by `Tab` anywhere in your terminal to invoke `fzf` for file/path selection.
* **Typo Recovery:** Mistyped a command? Type `fk` and hit enter.
* **Quick Nav:** Use `lt` for a quick visual overview of project structures instead of a long `ls` list.
* **Context Preservation:** Since `tmux-continuum` is set to `on`, your sessions will automatically save and restore after a reboot.
* **Session Management:** Always use `Prefix + S` to name your sessions; it makes using `SessionX` much easier when you have 10+ projects open.

---

*Last Updated: March 2026*

