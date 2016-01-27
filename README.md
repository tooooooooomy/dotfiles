# dotfiles

## Usage
```
cd ~/
git clone git@github.com:kazu9su/dotfiles.git 
cd dotfiles
sh dotfilesLink.sh
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# on vim
:NeoBundleInstall

# if you cannot install packages
cd ~/.vim/bundle/vimproc/
make
```
