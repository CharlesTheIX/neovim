# NEOVIM SETUP

This document contains the information required to setting up a Neovim configeration.

## Requirements

You will need to install Neovim: https://github.com/neovim/neovim/blob/master/INSTALL.md


## Todo

The Neovim config has only been confirmed on macOS and not Linux or Windows.
- Confirm set up on Linux
- Confirm setup on Windows


## File Structure

./ReadMe.md  -- This file
./init.lua   -- The root lua file that imports the desired version of the Neovim setup: mac | windows
./lua        -- The source directory of the project containing the version directories and the plugins directory containing the plugins used in this setup
    /linux   -- Contains the files for a Linux setup 
    /mac     -- Contains the files for a macOS setup
    /plugins -- Contains the Lazy plugin setups for the plugins used in this Neovim setup
    /windows -- Contains the files for a Windows setup


## Package Manager - Lazy

For more information specific to Lazy, see here: https://github.com/folke/lazy.nvim

This Package Manager has been chosen for this setup as the setup of packages appeared easier and more convenient than Packer. Other Package Managers have not been tried.
The setup of the Package Manager can be found in ./lua/[version]/lazy.lua. Within the init file of the version, the lazy setup is required after the setup of Neovim globals and options.

Lazy is set up to pull the plugins in from the ./lua/plugins directory. Within the plugins directory there are a number of files. Each of these files are named after the relevant plugin name or function it performs.
These plugin files contain the setting of that plugin where is is possible to configure the plugin depending on the Neovim setup.
This setup places the relevant keymaps of each plugin within the config of the plugin file.

Examples of Lazy configurations can be found on the Github pages of each plugin.

## Globals

This file sets the leader key for Neovim, sets the netrw settings and styles, and sets default keymaps.

## Options

This file sets the options for the default Neovim setup that requires no plugins, such as spell check, indentation etc.

## Useful Motions To Get Started

- <leader>pv - This motion will return you from a file buffer to the netrw buffer
- <leader>sf - This motion will pull up the telescope plugin search files buffer
- <leader>sk - This motion will pull up the telescope plugin search keymaps biffer
