# AGENTS.md - Dotfiles Repository Guide

## Repository Overview

This is a personal dotfiles repository containing configuration files for various Linux/macOS tools. There is no build system, package manager, or test suite—just configuration files.

## Repository Structure

```
dotfiles/
├── bash/           # Bash shell configuration (.bashrc)
├── dunst/          # Notification daemon configuration
├── git/            # Git configuration (.gitconfig)
├── htop/           # System monitor configuration
├── hypr/           # Hyprland window manager config
├── kitty/          # Terminal emulator configuration
├── nvim/           # Neovim configuration (Lua)
├── opencode/       # Opencode AI assistant configuration
├── starship/       # Shell prompt configuration (TOML)
├── tmux/           # Terminal multiplexer configuration
└── waybar/         # Wayland status bar configuration
```

## Configuration File Locations

Configs follow the XDG Base Directory specification:
- Configs are stored as `<tool>/.config/<tool>/<config-file>`
- These map to `~/.config/<tool>/<config-file>` when symlinked

## Code Style Guidelines

### Lua (Neovim Configuration)
- Use 2-space indentation
- Use double quotes for strings
- Prefer `local` for variable declarations
- Use `vim.opt` for options, `vim.keymap` for keymaps
- Group related settings with blank lines
- Format: `require("module")` with quotes

### TOML (Starship, Tool Configs)
- Use 2-space indentation
- Group related settings under section headers
- Prefer lowercase keys
- Keep boolean values lowercase (`true`/`false`)

### Bash Scripts
- Use 2-space indentation for consistency with Lua configs
- Quote all variables: `"$var"`
- Use `[[ ]]` for conditionals
- Add descriptive comments with `# --- Section ---`
- Functions use lowercase with hyphens: `my_function()`

### Shell Scripts (Waybar)
- Use POSIX-compatible syntax
- Quote all variable expansions
- Add shebang `#!/bin/bash` or `#!/bin/sh`
- Set `-e` flag for error handling: `set -e`

### Git Config
- Use tabs for indentation in gitconfig
- Keep user settings separate from aliases
- Default branch is `main`

### General Formatting
- No trailing whitespace
- End files with a single newline
- Use descriptive comments for complex sections
- Keep lines under 100 characters where reasonable

## Adding New Configurations

1. Create directory structure: `<tool>/.config/<tool>/`
2. Add configuration files
3. Update `.gitignore` if needed for tool-specific generated files
4. Do not commit:
   - Plugin directories (e.g., `tmux/plugins/`)
   - Lock files for package managers
   - Generated/theme files (e.g., `theme.txt`, `theme.conf`)
   - `node_modules/` directories

## Symlinking (Stow Method)

This repository is designed to work with GNU Stow:
```bash
stow <directory-name>  # Creates symlinks from ~ to repo
```

Example: `stow nvim` creates `~/.config/nvim` → `nvim/.config/nvim`

## Opencode Configuration

The `opencode/.config/opencode/` directory contains:
- `opencode.json` - Main configuration
- `package.json` - Plugin dependencies
- `node_modules/` - Auto-generated (do not commit)

## Common Patterns

### Neovim Plugin Structure
```lua
-- lua/siddhant/plugins/<plugin-name>.lua
return {
  "author/plugin-name",
  config = function()
    require("plugin").setup({})
  end,
}
```

### Tmux Keybindings
- Prefix key: backtick (`` ` ``)
- Vim-style navigation: `h`, `j`, `k`, `l`
- Confirm before destructive actions

## No Build/Test Commands

This repository has no:
- Build commands
- Test commands
- Linting commands
- CI/CD pipeline

Simply edit config files and test manually.

## Commit Guidelines

- Use descriptive commit messages
- Group related changes together
- Keep personal information (emails, tokens) out of commits
- Review changes with `git diff` before committing

## Resources

- Neovim Lua API: https://neovim.io/doc/user/lua.html
- Tmux man page: `man tmux`
- Starship config: https://starship.rs/config/
