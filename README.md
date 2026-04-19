# PaimanUwU's Dotfiles 🚀

Welcome to my personal dotfiles repository! This is where I store and manage all my configuration files for various applications and tools, ensuring a consistent and comfortable development environment across my machines.

## Overview

This repository uses [GNU Stow](https://www.google.com/search?q=https://www.gnu.org/software/stow/) to manage symbolic links for configuration files (`dotfiles`) from this repository into your home directory. This keeps your home directory clean and makes it easy to add or remove configurations.

## Features

* **Neovim (nvim):** My highly customized Neovim setup for a powerful and efficient coding experience.
* **Zsh & Powerlevel10k (p10k):** A beautiful and feature-rich Zsh shell with the blazing-fast Powerlevel10k theme.
* **tmux:** My configuration for the terminal multiplexer `tmux` for persistent sessions and split panes.
* **yazi:** Configuration for the modern, async, and customisable terminal file manager.
* **cava:** Setup for the console-based audio visualizer.
* **neofetch:** Configuration for displaying system information with an aesthetic touch.
* **Zed:** Configurations for the Zed code editor.
* **Brewfile:** Automated installation of macOS applications and tools using Homebrew.

## Installation

### Prerequisites

Before you begin, ensure you have the following installed:

* **Git:** For cloning this repository.
* **Homebrew (macOS):** My `Brewfile` automates software installation.
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

```


* **GNU Stow:** Used for symlinking the dotfiles.
```bash
brew install git
brew install stow

```



### Clone the Repository

First, clone this repository into a directory I recommend `~/Documents/Dotfiles`.

```bash
git clone https://github.com/PaimanUwU/Dotfiles.git ~/Documents/Dotfiles
cd ~/Documents/Dotfiles

```

### Install Applications (Homebrew)

My `Brewfile` contains a list of all the applications, command-line tools, and casks that I use. You can install all of them at once using Homebrew:

```bash
brew bundle install --file=Brewfile

```

This command will read the `Brewfile` in the root of this repository and install everything listed.

### Symlink Dotfiles (GNU Stow)

Once you've cloned the repository and installed Stow, navigate into the `~/dotfiles` directory and use `stow` to create symbolic links.

Each top-level directory (e.g., `nvim`, `zsh`, `tmux`) represents a package of dotfiles.

To "stow" all dotfiles, run:

```bash
stow */
```

To undo,

```bash
stow -D */
```

## Tips

you can read this [cheatsheet](https://github.com/PaimanUwU/Dotfiles/blob/97e810f3be8a612d26874ae5b3a3504b5c8fd97c/Cheatsheets.md)

or,

just run this command in the terminal to see the cheatsheets in the terminal.

```bash
cheats
```


## Structure

Here's an overview of the repository structure:

```
  .
 ├──  bat
 │   └──  .config
 │       └──  bat
 │           ├──  themes
 │           └── 󱁻 config
 ├──  cava
 │   └──  .config
 │       └──  cava
 │           ├──  shaders
 │           ├──  themes
 │           └── 󱁻 config
 ├──  fastfetch
 │   └──  .config
 │       └──  fastfetch
 │           └──  config.jsonc
 ├──  ghostty
 │   └──  .config
 │       └──  ghostty
 │           └── 󱁻 config
 ├──  images
 │   └── 󰉏 Pictures
 │       ├──  Screenshots
 │       │   ├──  'Screenshot 2026-03-10 at 3.38.57 AM.png'
 │       │   ├──  'Screenshot 2026-03-10 at 3.39.16 AM.png'
 │       │   ├──  'Screenshot 2026-03-10 at 3.39.56 AM.png'
 │       │   ├──  'Screenshot 2026-03-10 at 3.40.06 AM.png'
 │       │   └──  'Screenshot 2026-03-10 at 5.27.59 PM.png'
 │       └──  Wallpapers
 │           └──  waterfall.png
 ├──  neofetch
 │   └──  .config
 │       └──  neofetch
 │           └── 󱁻 config.conf
 ├──  nvim
 │   └──  .config
 │       └──  nvim
 │           ├──  lua
 │           ├──  LICENSE
 │           ├──  .neoconf.json
 │           ├──  lazy-lock.json
 │           ├──  lazyvim.json
 │           ├──  init.lua
 │           ├── 󰂺 README.md
 │           └──  stylua.toml
 ├──  p10k
 │   └──  .p10k.zsh
 ├──  tmux
 │   ├──  .config
 │   │   └──  tmux
 │   │       ├──  plugins
 │   │       └──  tmux.conf
 │   └──  .tmux
 │       └──  plugins
 │           └──  tpm
 ├──  yazi
 │   └──  .config
 │       └──  yazi
 │           ├──  keymap.toml
 │           ├──  theme.toml
 │           └──  yazi.toml
 ├──  zed
 │   └──  .config
 │       └──  zed
 │           ├──  prompts
 │           ├──  themes
 │           ├──  keymap.json
 │           └──  settings.json
 ├──  zsh
 │   ├──  .hushlogin
 │   └── 󱆃 .zshrc
 ├── 󱄖 Brewfile
 ├── 󰡯 'Ghostty Settings'
 ├── 󰊢 .gitignore
 ├──  Cheatsheets.md
 ├──  Markdown-Cheatsheets.md
 ├── 󰂺 README.md
 ├──  .stow-local-ignore
 └──  .stowrc

```

## Screenshots

Here are a few glimpses of my setup:

![screenshots 1](https://github.com/PaimanUwU/Dotfiles/blob/4dede3533270f3e044f576dae2db7503d3933a68/images/Pictures/Screenshots/Screenshot%202026-04-20%20at%2012.44.36%E2%80%AFAM.png)
![screenshots 2](https://github.com/PaimanUwU/Dotfiles/blob/4dede3533270f3e044f576dae2db7503d3933a68/images/Pictures/Screenshots/Screenshot%202026-04-20%20at%2012.45.30%E2%80%AFAM.png)
![screenshots 3](https://github.com/PaimanUwU/Dotfiles/blob/4dede3533270f3e044f576dae2db7503d3933a68/images/Pictures/Screenshots/Screenshot%202026-04-20%20at%2012.46.03%E2%80%AFAM.png)
![screenshots 4](https://github.com/PaimanUwU/Dotfiles/blob/4dede3533270f3e044f576dae2db7503d3933a68/images/Pictures/Screenshots/Screenshot%202026-04-20%20at%2012.46.57%E2%80%AFAM.png)
![screenshots 5](https://github.com/PaimanUwU/Dotfiles/blob/4dede3533270f3e044f576dae2db7503d3933a68/images/Pictures/Screenshots/Screenshot%202026-04-20%20at%2012.47.15%E2%80%AFAM.png)
![screenshots 6](https://github.com/PaimanUwU/Dotfiles/blob/4dede3533270f3e044f576dae2db7503d3933a68/images/Pictures/Screenshots/Screenshot%202026-04-20%20at%2012.47.27%E2%80%AFAM.png)

---

