#!/bin/bash

# Install dependencies
echo "Installing dependencies with apt-get"
sudo apt-get install git subversion gyp

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
    echo "D8 not found.  Javascript linting plugin will not work without it.  Do you want to install it now?  (Warning: this can take awhile):"
    select yn in "Yes" "No"; do
        case $yn in
            Yes )
                echo "Installing Chromium Depot Tools for building V8"
                git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git ~/depot_tools
                export PATH=~/depot_tools:"$PATH"

                echo "Installing D8 for Lint.Vim.  Please be patient..."
                if [ ! -d ~/v8 ]
                then
                    git clone git://github.com/v8/v8.git ~/v8 && cd ~/v8
                fi

                cd ~/v8
                make -j `nproc` dependencies
                make -j `nproc` native
                sudo cp ~/v8/out/native/d8 /usr/local/bin/
                cd ..
                echo "V8 successfully installed"
                echo "Remove v8 source?"
                select rmv8 in "Yes" "No"; do
                    case $rmv8 in
                        Yes ) rm -rf ~/v8; break;;
                        No ) break;;
                    esac
                done
                break;;
            No )
                echo "Javascript linting will not work without D8.  Run this script again if you change your mind."
                break;;
        esac
    done
fi

if [ ! -d ~/.vim/bundle/vim-javascript ]
then
    echo "Installing vim-javascript plugin"
    git clone git@github.com:pangloss/vim-javascript.git ~/.vim/bundle
fi

# Install Vim-Flake8 for PEP8 Checking
if [ ! -d ~/.vim/bundle/vim-flake8 ]
then
    echo "Installing Flake8 globally via pip for PEP8 checking.  If you use a virtualenv for development, you will need to install flake8 inside that too to enable PEP8 checking."
    sudo pip install flake8
fi

echo "Good to Go!"

