.PHONY: all, soft-gui, soft-no-gui, no-gui, zsh-config, vim-config, config-files, chsh, xmonad

all: soft-gui no-gui

no-gui: config-files soft-no-gui zsh-config vim-config chsh

files = toprc zshrc tmux.conf gitconfig astylerc rvmrc gemrc
install = ln -fs `pwd`/$(1) ~/.$(1);

config-files:
	$(foreach file, $(files), $(call install,$(file)))

zsh-config:
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

vim-config:
	if ! [ -d ~/.vim ]; then git clone https://github.com/kosl90/dotvim.git ~/.vim && (cd ~/.vim; make); fi

chsh:
	chsh -s /usr/bin/zsh

soft-gui:
	sudo apt-get install terminator synapse devhelp emacs dconf-tools\
		d-feet mercurial

soft-no-gui:
	sudo apt-get install cmake cmake-curses-gui zsh gdb git \
		clang-3.5 libclang-3.5-dev tmux manpages-posix-dev\
		exuberant-ctags subversion autojump

xmonad:
	sudo apt-get install xmonad
	git clone https://github.com/kosl90/xmonad ~/.xmonad
	(cd ~/.xmonad; make)


## compile vim
# if --disable-gui, --enable-xim is useless
#./configre --prefix=/usr --disable-gui --enable-cscope --enable-fontset \
#    --enable-largefile --enable-multibyte  --with-features=huge --with-x\
#	--enable-pythoninterp=yes \
#	--with-python-config-dir=/usr/lib/python2.7/config-i386-linux-gnu/ \
#	--enable-rubyinterp=yes \
#	--with-luajit --enable-luainterp=yes
#	may use dynamic

# either python2 or python3
# if python2 and python3 both are installed cannot use dynamic
# --with-python3-config-dir=/usr/lib/python3.3/config-3.3m-i386-linux-gnu --enable-python3interp=dynamic


## install vim dependencies.
# apt-get install lua5.1 luajit perl python-dev libperl-dev liblua5.1-0-dev libx11-dev libluajit-5.1-dev libacl1-dev libxt-dev


## set default editor
# sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
# sudo update-alternatives --set editor /usr/bin/vim
# sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
# sudo update-alternatives --set vi /usr/bin/vim
