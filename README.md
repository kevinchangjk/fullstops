# Full-stops

This repository contains the majority of my config files, but instead of naming it dots like some people, I decided on fullstops.

A good chunk of my configs were stolen from [Khang](https://github.com/nguyenvukhang), so feel free to look through and copy or criticise or comment.

## Components

As of now, these are the available components in my configs:

1. [Shell](#shell)
2. [Neovim](#neovim)
3. [Tmux](#tmux)
4. [Kitty](#kitty)
5. [Links](#links)
6. [Quote](#quote)

## Shell

I use macOS, and so my configs are mainly for zsh. Mainly contains a bunch of aliases, some shortcuts, and some personal touches.

`core` is the main skeleton of my configs, and allows me to use zsh to a functional degree. `brew` contains additional settings that makes life easier.

There's also a rather handy file, `zsh_cheatsheet.md`, which as the name suggests, is a cheatsheet for the zsh scripting language. Feel free to take it, since I took it from someone else too.

## Neovim

The `nvim` directory is basically my `.vimrc`. My vim hidden files, plugins and all, are stored somewhere else in my local machine, under `$XDG_CONFIG_HOME`, though for me that directory is basically a symlink of this directory.

I stole the color scheme (which matches my kitty and tmux colors) from [here](https://github.com/ful1e5/onedark.nvim).

## Tmux

Terminal Multiplexer. Basically contains some configs. Also, the onedark color scheme from [here](https://github.com/odedlaz/tmux-onedark-theme).

## Kitty

An alternative terminal. Also contains some configs (colorscheme from the same repo as nvim), and a nice background image for the terminal.

## Links

Basically symlinks for my other components to their required locations.

## Quote

A completely necessary feature that displays a motivational quote whenever the terminal starts up. Have added in some inspiring quotes from personal acquaintances also, so be careful if you want to copy this.
