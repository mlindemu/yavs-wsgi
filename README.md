# Yet Another VIM Setup - Python WSGI Edition
This is the setup script I use on new WSGI development machines.  Feel free to comment or edit as you see fit.

# Install
    git clone git://github.com/mlindemu/yavs-wsgi.git
    cd yavs-wsgi
    ./yavs-wsgi.sh

# What is Installed?
The following VIM plugins and programs are installed only if they are not already present on your machine:

* [Pathogen](https://github.com/tpope/vim-pathogen) - VIM Plugin Management
* [Syntastic](https://github.com/scrooloose/syntastic) - A comprehensive syntax highlighting plugin.
* [Vim-bundle-mako](https://github.com/sophacles/vim-bundle-mako) - Mako is not included in syntastic.  This plugin is included to alleviate that.
* [D8 from Google V8](https://code.google.com/p/v8/) - Javascript engine used by Lint.vim to check javascript syntax.  Downloads, compiles, installs, and removes source afterwards.
* [vim-javascript](https://github.com/pangloss/vim-javascript) - Javascript linting in vim.
* [VIM-Flake8](https://github.com/nvie/vim-flake8) - A Vim plugin that runs the currently open file through Flake8, a static syntax and style checker for Python source code. 

All plugins are installed under: *~/.vim/bundle*

# After Install
After installing the packages above, you must manually install flake8 on both your system and in any WSGI project virtualenv using either easy_install or pip.

# Suggestions?
Please feel free to suggest any other VIM plugins you find helpful on your WSGI development machines!  Just make an issue and I'll look into adding it.

Enjoy!
