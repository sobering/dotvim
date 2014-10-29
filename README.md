# dotvim
This is my repo for my Vim config. There are many like it, but this one is mine.

### Installation
1. Clone the repository:

		git clone git@github.com:sobering/dotvim.git ~/.vim
		
2. Symlink things:

		ln -s ~/.vim/.vimrc ~/.vimrc
		
3. Initialize and update the Vundle submodule:

		cd ~/.vim
		git submodule init
		git submodule update

4. Install your plugins:

		vim +BundleInstall! +BundleClean +qall

5. Be cool :metal:
