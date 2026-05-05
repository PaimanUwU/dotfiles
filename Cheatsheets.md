█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀
█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░

**Greeting:** `>w<` | **Shell:** 🐟 Fish | **Vi Mode:** Active | **Theme:** Catppuccin Mocha

---

## 🧠 Second Brain (Terminal PKM)
| Action | Command / Key | Notes |
| :--- | :--- | :--- |
| **Quick Open** | `Prefix + B` | (Tmux) New window direct to Brain |
| **Float Brain** | `Prefix + g` | (Tmux) Popup Yazi for quick reference |
| **Search Notes** | `brain search` | Global `fzf` + `bat` preview |
| **New Note** | `brain new [title]` | Creates `[YYYY-MM-DD]title.md` in Inbox |
| **New Folder** | `brain mkdir [p/a/r]` | Create subfolders in PARA pillars |
| **Task View** | `brain todo` | Aggregates all `- [ ]` tasks |
| **Quick Capture** | `brain cap "[msg]"` | Appends to root `capture.md` |
| **Academic Jump**| `fclass` | Search **CS230/CS110** folders only |
| **Sync** | `brain sync` | Git auto-sync knowledge base |

---

## 🐚 Fish Core & Navigation
| Action | Command / Abbr | Notes |
| :--- | :--- | :--- |
| **Open Yazi** | `y` | Syncs `cwd` on exit |
| **Quick Jump** | `z [folder]` | Zoxide: smart folder jumping |
| **Modern LS** | `ls` | `eza` with Git & Icons |
| **Folder Tree** | `lt` | `ezatree --level=%cursor` |

---

## 🌿 Git & Lazygit Workflow
| Action | Abbr / Key | Notes |
| :--- | :--- | :--- |
| **Open Lazygit** | `lg` | The ultimate TUI for Git |
| **Commit** | `gc` | `git commit -m "%cursor"` |
| **Push** | `gp` | `git push` |
| **Log** | `gl` | Visual graph with relative time |

---

## 💻 Developer Workflow
| Action | Abbr / Alias | Notes |
| :--- | :--- | :--- |
| **Quick Edit Config** | `config [fish/tmux/ghostty/nvim]` | Points to your Dotfiles |
| **Reload Config** | `sourcefish` | Hot-reloads `config.fish` |
| **Neovim** | `v` | Uses Vi mode cursor logic |
| **Tmux Reload** | `Prefix + r` | Reloads `tmux.conf` |

---

## 💡 Custom Pro-Tips
* **Brain Hierarchy:** `p` = Projects, `a` = Areas, `r` = Resources.
* **Non-Blocking:** Use `Prefix + g` to check notes while coding without switching windows.
* **Syncing:** Always run `brain sync` before shutting down to ensure your CS230 notes are backed up.
* **Vi Mode:** `|` is Insert mode, `█` is Normal mode. Hit `Esc` to toggle.

---

*Last Updated: May 5, 2026* | `>w<`
