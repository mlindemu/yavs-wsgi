# Yet Another VIM Setup - WSGI Edition
This is the setup script I use on new WSGI development machines.  Feel free to comment or edit as you see fit.

# How To Run?
    git clone git://github.com/mlindemu/yavs-wsgi.git
    cd yavs-wsgi
    ./yavs-wsgi.sh

# What is Installed?
The following VIM plugins are installed only if they are not already present on your machine:

* [Pathogen](https://github.com/tpope/vim-pathogen) - VIM Plugin Management
* [Syntastic](https://github.com/scrooloose/syntastic) - A comprehensive syntax highlighting plugin.
* [vim-bundle-mako](https://github.com/sophacles/vim-bundle-mako) - Mako is not included in syntastic.  This plugin is included to alleviate that.
* [D8 from Google V8](https://code.google.com/p/v8/) - Used by Lint.vim to check javascript syntax.  Downloads, compiles, installs, and removes source afterwards.
* [Lint.vim](https://github.com/joestelmach/lint.vim) - A javascript and css lint syntax checker.
* [jedi-vim](https://github.com/davidhalter/jedi-vim) - A Python autocomplete plugin.

All plugins are installed under: *~/.vim/bundle*

# Suggestions?
Please feel free to suggest any other VIM plugins you find helpful on your WSGI development machines!  Just make an issue and I'll look into adding it.

Enjoy!
