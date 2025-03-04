# NEOVIM SETUP

This document contains the information required to setting up a neovim configeration.

## Requirements

You will need to install Neovim: https://github.com/neovim/neovim/blob/master/INSTALL.md

## File Structure

./ReadMe.md  -- This file
./init.lua   -- The root lua file that imports the desired version of the neovim setup: mac | windows
./lua        -- The source directory of the project containing the version directories and the plugins directory containing the plugins used in this setup
    /linux   -- Contains the files for a Linux setup 
    /mac     -- Contains the files for a macOS setup
    /plugins -- Contains the Lazy plugin setups for the plugins used in this Neovim setup
    /windows -- Contains the files for a Windows setup

## Package Manager - Lazy

For more information specific to Lazy, see here: https://github.com/folke/lazy.nvim


