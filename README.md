# dotfiles

Okay, this is an excellent structure for a `dotfiles` repository! Let's craft a comprehensive and user-friendly `README.md` for it, incorporating your requirements for images, Homebrew, and GNU Stow.

Here's a draft for your `README.md`:

---

# PaimanUwU's Dotfiles 🚀

Welcome to my personal dotfiles repository! This is where I store and manage all my configuration files for various applications and tools, ensuring a consistent and comfortable development environment across my machines.

## Table of Contents

* [Overview](https://www.google.com/search?q=%23overview)
* [Features](https://www.google.com/search?q=%23features)
* [Installation](https://www.google.com/search?q=%23installation)
* [Prerequisites](https://www.google.com/search?q=%23prerequisites)
* [Clone the Repository](https://www.google.com/search?q=%23clone-the-repository)
* [Install Applications (Homebrew)](https://www.google.com/search?q=%23install-applications-homebrew)
* [Symlink Dotfiles (GNU Stow)](https://www.google.com/search?q=%23symlink-dotfiles-gnu-stow)


* [Structure](https://www.google.com/search?q=%23structure)
* [Screenshots](https://www.google.com/search?q=%23screenshots)
* [Credits](https://www.google.com/search?q=%23credits)

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
brew install stow

```



### Clone the Repository

First, clone this repository into a directory in your home folder. I recommend `~/dotfiles`.

```bash
git clone git@github.com:PaimanUwU/dotfiles.git ~/dotfiles
cd ~/dotfiles

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
stow .
```

## Structure

Here's an overview of the repository structure:

```
.
├── cava
│   └── .config
│       └── cava
├── image
│   ├── 'Screenshot 2026-03-10 at 3.38.57 AM.png'
│   ├── 'Screenshot 2026-03-10 at 3.39.16 AM.png'
│   ├── 'Screenshot 2026-03-10 at 3.39.56 AM.png'
│   ├── 'Screenshot 2026-03-10 at 3.40.06 AM.png'
│   └── waterfall.png
├── neofetch
│   └── .config
│       └── neofetch
├── nvim
│   └── .config
│       └── nvim
├── p10k
│   └── .p10k.zsh
├── tmux
│   ├── .config
│   │   └── tmux
│   └── .tmux
│       └── plugins
├── yazi
│   └── .config
│       └── yazi
├── zed
│   └── .config
│       └── zed
├── zsh
│   ├── .hushlogin
│   └── .zshrc
├── Brewfile
├── 'Ghostty Settings'
├── README.md
├── .stow-local-ignore
└── .stowrc

```

## Screenshots

Here are a few glimpses of my setup:

### Terminal and Neofetch, also Neovim in Action

A quick look at my terminal, showing off `neofetch` and the prompt. My Neovim setup, ready for coding.

(image/Screenshot 2026-03-10 at 3.39.16 AM.png)

### Yazi File Manager

Exploring files with the `yazi` terminal file manager.


---

