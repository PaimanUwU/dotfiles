█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀
█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░

**Greeting:** `>w<` | **Shell:** 🐟 Fish | **Vi Mode:** Active | **Theme:** Catppuccin Mocha

---

## 🧠 Second Brain (Terminal PKM)
| Action | Command | Notes |
| :--- | :--- | :--- |
| **Open Brain** | `brain` | Opens **Yazi** in `~/Documents/Notes` |
| **Search Notes** | `brain search` | Global `fzf` + `bat` preview across all notes |
| **New Note** | `brain new [title]` | Creates `[YYYY-MM-DD]title.md` in Inbox |
| **Quick Capture** | `brain cap "[msg]"` | Appends thought to `capture.md` |
| **Task View** | `brain todo` | Aggregates all `- [ ]` tasks from all files |
| **Academic Jump** | `fclass` | Search specifically in **CS230/CS110** folders |
| **Visual Tree** | `brain dir` | `ezatree` overview of your brain |
| **Sync** | `brain sync` | Git add/commit/push your knowledge base |
| **Help** | `brain -h` | View all subcommands |

---

## 🐚 Fish Core & Navigation

### 📂 Navigation & Abbreviations
| Action | Command / Abbr | Notes |
| :--- | :--- | :--- |
| **Open Yazi** | `y` | Syncs `cwd` on exit + Bar cursor fix |
| **Quick Jump** | `z [folder]` | Zoxide: jumps to frequent folders |
| **Modern LS** | `ls` | `eza` with Git & Icons |
| **Folder Tree** | `lt` | Expands to `ezatree --level=%cursor` |


### ⌨️ Completion & History Keybindings
| Key | Action | Result |
| :--- | :--- | :--- |
| **`Tab`** | **Tab Complete** | Shows options with descriptions |
| **`Ctrl + R`** | **History** | Interactive `fzf` search through history |
| **`→` or `Ctrl + F`** | **Accept** | Accepts the grey "ghost text" suggestion |
| **`Alt + →`** | **Partial Accept** | Accepts only the next word |

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
| **Edit Config** | `fishconfig` | Points to your Dotfiles |
| **Reload Config** | `sourcefish` | Hot-reloads `config.fish` |
| **Neovim** | `v` | Uses Vi mode cursor logic |
| **Home Server** | `lab` | New Tmux window + SSH |

---

## 💡 Custom Pro-Tips
* **Daily Workflow:** Start your day with `brain new Daily Log` to clear your head.
* **Academic Success:** Use `fclass` during lectures to quickly reference previous diploma (CS110) notes.
* **Vi Mode:** `|` is Insert mode, `█` is Normal mode. Hit `Esc` to toggle.

---

*Last Updated: May 5, 2026*
