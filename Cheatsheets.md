# 🚀 Master Cheat Sheet (2026)

**Prefix Key:** `Ctrl + Space`

## 🐚 ZSH Environment

| Category | Alias | Action |
| --- | --- | --- |
| **System** | `cheats` | Opens this file in `glow` |
|  | `ls` / `lt` | List (icons/git) / Tree view |
| **Git** | `gs` / `ga` / `gc` / `gp` | Status / Add / Commit / Push |
|  | `gl` | Pretty graphical log |
| **Dev** | `ni` / `nr` | `npm install` / `npm run` |
|  | `cu` / `ci` | `composer update` / `install` |
| **Utility** | `y` | Launch **Yazi** file manager |
|  | `path` | View system PATH cleanly |
|  | `fk` | "The Fuck" - Fix last command |

---

## 🛠️ Tmux Configuration

| Category | Keybinding | Action |
| --- | --- | --- |
| **System** | `Prefix` + `r` | Reload `tmux.conf` |
|  | `Prefix` + `e` | Detach client |
| **Sessions** | `Prefix` + `s` | Open **SessionX** (FZF) |
|  | `Prefix` + `S` | New session (Prompt) |
| **Splits** | `Prefix` + `d` | Split Vertical (Right) |
|  | `Prefix` + `D` | Split Horizontal (Down) |
|  | `Prefix` + `T` | Small terminal pane (bottom) |
| **Navigation** | `Ctrl` + `h/j/k/l` | Vim-style movement |
| **Resize** | `Prefix` + `H/J/K/L` | Resize current pane |
| **Windows** | `Prefix` + `n` / `p` | Next / Previous window |

---

## 🪄 Plugin Shortcuts

| Plugin | Action | Keybinding |
| --- | --- | --- |
| **Floax** | Toggle floating pane | `Prefix` + `f` |
| **SessionX** | Add Session (in UI) | `Ctrl` + `a` |
|  | Delete Session (in UI) | `Ctrl` + `x` |
|  | Zoxide Mode | `Ctrl` + `z` |
|  | New Window | `Ctrl` + `y` |
| **FZF** | Shell Selection | Type `**` then `Tab` |

---

## 💡 Productivity Hacks

* **The "Magic" Trigger:** Type `**` followed by `Tab` anywhere in your terminal to invoke `fzf` for file/path selection.
* **Typo Recovery:** Mistyped a command? Type `fk` and hit enter.
* **Quick Nav:** Use `lt` for a quick visual overview of project structures instead of a long `ls` list.
* **Context Preservation:** Since `tmux-continuum` is set to `on`, your sessions will automatically save and restore after a reboot.
* **Session Management:** Always use `Prefix + S` to name your sessions; it makes using `SessionX` much easier when you have 10+ projects open.

---

*Last Updated: March 2026*

