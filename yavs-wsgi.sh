#!/bin/bash

# Install Pathogen
if [ ! -d ~/.vim/autoload ]
then
    mkdir -p ~/.vim/autoload
fi

if [ ! -d ~/.vim/bundle ]
then
    mkdir -p ~/.vim/bundle
fi

if [ ! -f ~/.vim/autoload/pathogen.vim ]
then
    echo "Installing Pathogen"
    curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
    # Add Pathogen to vimrc
    echo "execute pathogen#infect()" >> ~/.vimrc
fi

# Install Syntastic
if [ ! -d ~/.vim/bundle/syntastic ]
then
    echo "Installing Syntastic"
    git clone git://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
fi

# Install Mako Syntax
if [ ! -d ~/.vim/bundle/vim-bundle-mako ]
then
    echo "Installing Mako.Vim Bundle"
    git clone git://github.com/sophacles/vim-bundle-mako.git ~/.vim/bundle/vim-bundle-mako
fi

# Install Lint.Vim
# First Setup D8 if required
if [ ! -f /usr/local/bin/d8 ]
then
    echo "Installing D8 for Lint.Vim.  Please be patient..."
    git clone git://github.com/v8/v8.git v8 && cd v8
    make dependencies
    make native
    sudo cp opt/native/d8 /usr/local/bin/
    cd ..
    rm -rf v8
fi

# Git Lint.Vim
if [ ! -d ~/.vim/bundle/lint.vim ]
then
    echo "Installing Lint.Vim"
    git clone git://github.com/joestelmach/lint.vim.git ~/.vim/bundle/lint.vim
fi

# Install Vim-Jedi Plugin
if [ ! -d ~/.vim/bundle/jedi-vim ]
then
    echo "Installing Jedi Plugin. For Python autocompletion.  Please install jedi on both your system and every wsgi virtualenv using pip or easy_install."
    git clone git://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
fi

echo "Good to Go!"

