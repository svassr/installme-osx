#!/bin/sh


# setup folder structure
mkdir ~/Projects

# brew setup
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# Core utils
brew install coreutils
brew install findutils

# Dependencies
brew install jpeg-turbo
brew install optipng
brew install readline

# Apps
brew install the_silver_searcher
brew install ant
brew install git
brew install mercurial
brew install node
brew install irssi
brew install phantomjs
brew install unrar
brew install trash
brew install tree
brew install wget

# MacVim for terminal
brew install macvim
alias vim='mvim -v'

# OSX native apps
brew install caskroom/cask/brew-cask

function brewcask() {
    brew cask install "${@}" 2> /dev/null
}

# dev-related programs
brewcask atom
brew install homebrew/completions/apm-bash-completion
brewcask intellij-idea
brewcask dropbox
brewcask google-chrome
brewcask google-chrome-canary
brewcask firefox
brewcask opera
brewcask iterm2
brewcask sourcetree

# dev-related programs - install rvm
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# dev-related programs - install Vagrant
brewcask vagrant #require root autorisation
brewcask vagrant-manager
brew install  homebrew/completions/vagrant-completion

# dev-related programs - install meteor
\curl https://install.meteor.com/ | sh

# utils
brewcask skype
brewcask vlc
brewcask cleanmymac
brewcask macpaw-gemini
brewcask spotify
brewcask deezer

# games
brewcask steam
# brewcask minecraft
# brewcask openttd


# npm dependencies that I'm not likely to live without
npm install -g nvm
npm install -g jshint
npm install -g jsxhint
npm install -g grunt-cli
npm install -g gulp
npm install -g yo
npm install -g http-server
npm install -g jasmine
npm install -g mocha


# vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Go to bundle folder
cd ~/.vim/bundle/

# Get all plugins
git clone https://github.com/vim-scripts/bufkill.vim
git clone https://github.com/wincent/Command-T.git
echo "Command-T will need extra setup, please review its docs"
open https://github.com/wincent/Command-T/blob/master/doc/command-t.txt#L174
git clone https://github.com/rking/ag.vim
git clone https://github.com/editorconfig/editorconfig-vim.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/mitechie/pyflakes-pathogen.git
git clone https://github.com/scrooloose/syntastic.git
echo "Syntastic will rely on code validation tools, such as jshint"
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/nvie/vim-flake8.git
git clone https://github.com/mhinz/vim-signify.git
git clone https://github.com/millermedeiros/vim-statline.git
git clone https://github.com/AndrewRadev/splitjoin.vim.git
git clone https://github.com/godlygeek/tabular.git
git clone https://github.com/elzr/vim-json.git
git clone https://github.com/ruyadorno/vim-change-indent.git
git clone https://github.com/groenewege/vim-less.git
git clone https://github.com/skammer/vim-css-color.git
git clone https://github.com/hail2u/vim-css3-syntax
git clone https://github.com/othree/html5.vim.git


# Configure Command-T
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make


## Get dotfiles repo and setup symlinks
cd ~/Projects/
git clone https://github.com/svassr/dotfiles.git

~/Projects/dotfiles/bootstrap.sh

cd ~/
ln -s ~/Projects/dotfiles/.bash_profile .bash_profile
ln -s ~/Projects/dotfiles/.gitconfig .gitconfig
ln -s ~/Projects/dotfiles/.gitignore .gitignore
ln -s ~/Projects/dotfiles/.vimrc .vimrc
