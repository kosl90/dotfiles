.PHONY: all, soft-gui, soft-no-gui, no-gui, zsh-config, vim-config, config-files, chsh, xmonad

all:
	@sh ./install.sh


soft-gui:
	@sh ./install.sh soft-gui


soft-no-gui:
	@sh ./install.sh soft-no-gui


no-gui:
	@sh ./install.sh no-gui


zsh-config:
	@sh ./install.sh zsh-config


vim-config:
	@sh ./install.sh vim-config


config-files:
	@sh ./install.sh config-files


chsh:
	@sh ./install.sh chsh


xmonad:
	@sh ./install.sh xmonad
