#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".macos" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

# Create .extras file for symlink
cat << 'EOF' > .extras
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name/email

GIT_AUTHOR_NAME="some one"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"

GIT_AUTHOR_EMAIL="random@email.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
EOF


# Create Symlinks
ln -s ~/.dotfiles/.config/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/git/gitconfig ~/gitconfig
ln -s ~/.dotfiles/git/gitignore ~/gitignore
ln -s ~/.dotfiles/git/gitattributes ~/gitattributes
ln -s ~/.dotfiles/.config ~/.config
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.dotfiles/.extras ~/.extras
ln -s ~/.dotfiles/.config/bash/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.config/bash/.bash_prompt ~/.bash_prompt
ln -s ~/.dotfiles/.config/bash/.bash_profile ~/.bash_profile

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew list | xargs brew uninstall