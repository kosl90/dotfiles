.PHONY: all, soft-gui, soft-no-gui, no-gui, zsh-config, vim-config, config-files, chsh, xmonad, pip, bash-rc, shellrc, zsh-rc, mac, xcode-select, brew, phantom

OS:=$(shell uname)
ifneq (,$(wildcard /etc/os-release))
  OS=$(subst ID=,,$(shell echo `grep -w ID /etc/os-release`))
endif

$(info >> OS: $(OS), User: $(USER))

DETECT_INS=
ifeq (arch,$(OS))
  DETECT_INS=pacman -S
else ifeq (Darwin,$(OS))
  # $(info >> Not support install in mac)
  DETECT_INS=brew install
else
  DETECT_INS=apt install
endif

ifneq (root,$(USER))
  ifneq (,$(DETECT_INS))
    ifneq (Darwin,$(OS))
      $(info >> using sudo to install)
      DETECT_INS=sudo $(DETECT_INS)
    endif
  endif
endif

INS?=$(DETECT_INS)

files=toprc tmux.conf gitconfig rvmrc gemrc fehbg gtkrc-2.0 gitignore_global gitmessage condarc

ZCP=$${ZSH_CUSTOM:-$${HOME}/.oh-my-zsh/custom}/plugins
PIP_CONFIG=$${HOME}/.config/pip
USER_DOTFILE_PATH=$${HOME}/$(shell basename $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

all: config-files zsh-config vim-config kitty-config

no-gui: config-files soft-no-gui zsh-config vim-config kitty-config chsh

define installZshPlugin
    url=$(1); \
        dist=$(2); \
        name=`echo $(1) | awk -F'/' '{print $$NF}'`; \
        printf ">> installing zsh plugin $${name}..."; \
        if [ -d $(ZCP)/$${name} ]; then \
            echo "already installed"; \
        else \
            echo; \
            git clone $${url} $(ZCP)/$${name}; \
            echo 'done'; \
        fi
endef

define installConfig
  ln -fs ${USER_DOTFILE_PATH}/$(1) ~/.$(1);
endef

pip:
	@printf '>> installing pip config...'
	@mkdir -p ${PIP_CONFIG}
	@ln -fs `pwd`/pip.conf ${PIP_CONFIG}/pip.conf
	@echo 'done'

config-files: pip
	@printf '>> installing other config files...'
	@$(foreach file, $(files), $(call installConfig,$(file)))
	@cp npmrc ~/.npmrc
	@echo 'done'

# TODO: maybe install `fnm` for linux/windows

zsh-rc:
	@printf '>> installing zshrc...'
	@[ -f $${HOME}/.zshrc ] || \
		(echo '########## USER DOTFILE CONFIGURATION ##########' >> $${HOME}/.zshrc; \
		echo '### CONFIGURATION SWITCH ###' >> $${HOME}/.zshrc; \
		echo 'USE_PROMPT="" # "p10k" | "pure" | "starship"' >> $${HOME}/.zshrc; \
		echo 'USE_BAT_FOR_MANPAGE=true' >> $${HOME}/.zshrc; \
		echo '' >> $${HOME}/.zshrc; \
		echo 'export USER_DOTFILE_PATH=${USER_DOTFILE_PATH}' >> $${HOME}/.zshrc; \
		echo '. $${USER_DOTFILE_PATH}/zshrc' >> $${HOME}/.zshrc;)
	@echo 'done'


zsh-config: zsh-rc zsh-oh-my-zsh zsh-plugins


zsh-plugins:
	@echo '>>' zsh plugin directory: ${ZCP}
	@$(call installZshPlugin,https://github.com/zsh-users/zsh-autosuggestions)
	# @$(call installZshPlugin,https://github.com/zsh-users/zsh-syntax-highlighting)
	@$(call installZshPlugin,https://github.com/z-shell/F-Sy-H)
	@$(call installZshPlugin,https://github.com/zsh-users/zsh-completions)
	@$(call installZshPlugin,https://github.com/paulirish/git-open)
	@$(call installZshPlugin,https://github.com/Aloxaf/fzf-tab)

zsh-oh-my-zsh:
	@printf '>> installing oh-my-zsh...'; \
	if ! [ -d ~/.oh-my-zsh ]; then \
            git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; \
            echo 'done'; \
        else echo 'already installed'; fi


bash-rc:
	@echo install bashrc
	@ln -fs `pwd`/bashrc $${HOME}/.bashrc.repo;
	@[ -f $${HOME}/.bashrc.repo ] && \
		echo '########## USER DOTFILE CONFIGURATION ##########' >> $${HOME}/.bashrc; \
		echo 'export USER_DOTFILE_PATH=${USER_DOTFILE_PATH}' >> $${HOME}/.bashrc; \
		echo '. $${HOME}/.bashrc.repo' >> ~/.bashrc


shellrc: zsh-config kitty-config bash-rc


vim-config:
	@printf '>> installing vim config...'
	@if ! [ -d ~/.vim ]; then \
		git clone https://github.com/kosl90/dotvim.git ~/.vim && (cd ~/.vim; make); \
		echo 'done'; \
		else \
		echo 'already installed'; \
		fi


chsh:
	chsh -s $$(which zsh)


soft-gui:
	[ X$(INS) = X ] || $(INS) terminator synapse devhelp dconf-tools\
		d-feet mercurial gtk-chtheme

curl:
	[ X$(INS) = X ] || $(INS) curl

soft-no-gui: curl
	[ X$(INS) = X ] || $(INS) cmake cmake-curses-gui zsh gdb git \
		clang libclang-dev tmux manpages-posix-dev\
		exuberant-ctags subversion autojump w3m cmake-extras


xmonad:
	[ X$(INS) = X ] || $(INS) xmonad dmenu && \
	git clone https://github.com/kosl90/xmonad-config ~/.xmonad && \
	(cd ~/.xmonad; make)

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

xcode-select:
	xcode-select --install

mac: xcode-select brew
	# anaconda
	$(INS) jq yq gron pure bat delta fzf vim fd eza hyperfine tmux ripgrep pnpm fnm tree
	$(INS) --cask linearmouse hiddenbar kitty iterm2 raycast

mac-dev:
	$(INS) pkg-config cmake cmake-docs
	$(INS) --cask wireshark

kitty-config:
	@mkdir -p ${HOME}/.config/kitty/
	@ln -fs ${USER_DOTFILE_PATH}/kitty.conf ${HOME}/.config/kitty/kitty.conf


phantom:

