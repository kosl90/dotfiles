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

files=toprc tmux.conf rvmrc gemrc fehbg gtkrc-2.0 gitignore_global gitmessage condarc
mac_files=toprc tmux.conf gemrc gitignore_global gitmessage condarc

ZCP=$${ZSH_CUSTOM:-$${HOME}/.oh-my-zsh/custom}/plugins
ZCT=$${ZSH_CUSTOM:-$${HOME}/.oh-my-zsh/custom}/themes
PIP_CONFIG=$${HOME}/.config/pip
USER_DOTFILE_PATH=$${HOME}/$(shell basename $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

.PHONY: all
all: config-files zsh-config vim-config kitty-config

.PHONY: no-gui
no-gui: config-files soft-no-gui zsh-config vim-config kitty-config chsh

define installCustomZsh
		part="${1}"; \
		url="${2}"; \
		dist="${3}"; \
		name=`echo $${url} | awk -F'/' '{print $$NF}'`; \
        printf ">> installing zsh $${part} $${name}..."; \
        if [ -d $${dist}/$${name} ]; then \
            echo "already installed"; \
        else \
            echo; \
            git clone --depth=1 $${url} $${dist}/$${name}; \
        fi
endef

define installZshPlugin
		$(call installCustomZsh,"plugin",$(1),$(ZCP));
    # url=$(1); \
    #     dist=$(2); \
    #     name=`echo $(1) | awk -F'/' '{print $$NF}'`; \
    #     printf ">> installing zsh plugin $${name}...\n";
    #     if [ -d $(ZCP)/$${name} ]; then \
    #         echo "already installed"; \
    #     else \
    #         echo; \
    #         git clone $${url} $(ZCP)/$${name}; \
    #         echo 'done'; \
    #     fi
endef

define installZshTheme
	$(call installCustomZsh,"theme",$(1),$(ZCT))
endef

define installConfig
  ln -fs ${USER_DOTFILE_PATH}/$(1) ~/.$(1);
endef

GIT_AUTH_CONFIG=$${HOME}/.config

.PHONY: git-auth
git-auth:
	@printf '>> installing git auth config...'
	@mkdir -p ${GIT_AUTH_CONFIG}
	@ln -fs `pwd`/gitauthor.json  ${GIT_AUTH_CONFIG}/gitauthor.json
	@echo 'done'

.PHONY: pip
pip:
	@printf '>> installing pip config...'
	@mkdir -p ${PIP_CONFIG}
	@ln -fs `pwd`/pip.conf ${PIP_CONFIG}/pip.conf
	@echo 'done'


.PHONY: git-config
git-config: git-auth
	@printf '>> installing git config...'
	@cp -rf ${USER_DOTFILE_PATH}/gitconfig ~/.gitconfig
	@$(call installConfig,gitmessage)
	@$(call installConfig,gitignore_global)
	@echo 'done'


.PHONY: config-files
config-files: pip git-config
	@printf '>> installing other config files...'
	@$(foreach file, $(files), $(call installConfig,$(file)))
	@cp npmrc ~/.npmrc
	@echo 'done'

.PHONY: mac-config-files
mac-config-files: pip git-config
	@printf '>> installing config files for mac...'
	@$(foreach file, $(mac_files), $(call installConfig, $(file)))
	@echo 'done'


# TODO: maybe install `fnm` for linux/windows


.PHONY: zsh-rc
zsh-rc:
	@printf '>> installing zshrc...'
	@[ -f $${HOME}/.zshrc ] || \
		(echo '########## USER DOTFILE CONFIGURATION ##########' >> $${HOME}/.zshrc; \
		echo '### CONFIGURATION SWITCH ###' >> $${HOME}/.zshrc; \
		echo 'USE_PROMPT="p10k" # "p10k" | "pure" | "starship"' >> $${HOME}/.zshrc; \
		echo 'USE_MANPAGER="bat" # "bat" | "nvim"' >> $${HOME}/.zshrc; \
		echo '' >> $${HOME}/.zshrc; \
		echo 'export USER_DOTFILE_PATH=${USER_DOTFILE_PATH}' >> $${HOME}/.zshrc; \
		echo '. $${USER_DOTFILE_PATH}/zshrc' >> $${HOME}/.zshrc;) \
		ln -sf $(PWD)/shell/zsh/p10k.zsh ~/.p10k.zsh
	@echo 'done'


.PHONY: zsh-config
zsh-config: zsh-rc zsh-oh-my-zsh zsh-plugins


.PHONY: zsh-plugins
zsh-plugins:
	@echo '>>' zsh plugin directory: ${ZCP};
	@$(call installZshPlugin,https://github.com/zsh-users/zsh-autosuggestions);
	@$(call installZshPlugin,https://github.com/z-shell/F-Sy-H);
	@$(call installZshPlugin,https://github.com/zsh-users/zsh-completions);
	@$(call installZshPlugin,https://github.com/Aloxaf/fzf-tab);


	# @$(call installZshPlugin,https://github.com/zsh-users/zsh-syntax-highlighting)
	# @$(call installZshPlugin,https://github.com/paulirish/git-open)
	# @$(call installZshPlugin,https://github.com/g-plane/pnpm-shell-completion) # 暂未适配，请先手动下载 release 文件，然后安装


.PHONY: zsh-themes
zsh-themes:
	@echo '>>' zsh theme directory: ${ZCT};
	@$(call installZshTheme,https://github.com/romkatv/powerlevel10k)


.PHONY: zsh-oh-my-zsh
zsh-oh-my-zsh:
	@printf '>> installing oh-my-zsh...'; \
	if ! [ -d ~/.oh-my-zsh ]; then \
            git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; \
            echo 'done'; \
        else echo 'already installed'; fi


.PHONY: bash-rc
bash-rc:
	@echo install bashrc
	@ln -fs `pwd`/bashrc $${HOME}/.bashrc.repo;
	@[ -f $${HOME}/.bashrc.repo ] && \
		echo '########## USER DOTFILE CONFIGURATION ##########' >> $${HOME}/.bashrc; \
		echo 'export USER_DOTFILE_PATH=${USER_DOTFILE_PATH}' >> $${HOME}/.bashrc; \
		echo '. $${HOME}/.bashrc.repo' >> ~/.bashrc


.PHONY: shellrc
shellrc: zsh-config kitty-config bash-rc


.PHONY: vim-config
vim-config:
	@printf '>> installing vim config...'
	@if ! [ -d ~/.vim ]; then \
		git clone https://github.com/kosl90/dotvim.git ~/.vim && (cd ~/.vim; make); \
		echo 'done'; \
		else \
		echo 'already installed'; \
		fi


.PHONY: chsh
chsh:
	chsh -s $$(which zsh)


.PHONY: soft-gui
soft-gui:
	[ X$(INS) = X ] || $(INS) terminator synapse devhelp dconf-tools\
		d-feet mercurial gtk-chtheme

.PHONY: curl
curl:
	[ X$(INS) = X ] || $(INS) curl


.PHONY: soft-no-gui
soft-no-gui: curl
	[ X$(INS) = X ] || $(INS) cmake cmake-curses-gui zsh gdb git \
		clang libclang-dev tmux manpages-posix-dev\
		exuberant-ctags subversion autojump w3m cmake-extras


.PHONY: xmonad
xmonad:
	[ X$(INS) = X ] || $(INS) xmonad dmenu && \
	git clone https://github.com/kosl90/xmonad-config ~/.xmonad && \
	(cd ~/.xmonad; make)


.PHONY: brew
brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


.PHONY: xcode-select
xcode-select:
	xcode-select --install


.PHONY: mac
mac: xcode-select brew mac-config-files zsh-config squirrel
	# anaconda
	$(INS) jq yq gron pure bat delta fzf vim fd eza hyperfine tmux ripgrep pnpm fnm tree go
	$(INS) --cask linearmouse hiddenbar kitty iterm2 raycast squirrel-app


.PHONY: mac-dev
mac-dev:
	$(INS) pkg-config cmake cmake-docs
	$(INS) --cask wireshark


.PHONY: squirrel
squirrel:
	ln -s ~/.dotfiles/rime-ice/ ~/Library/Rime


.PHONY: squirrel-custom-pure
squirrel-custom-pure:
	ln -s ~/.dotfiles/rime-custom/default.custom.yaml ~/Library/Rime/default.custom.yaml
	ln -s ~/.dotfiles/rime-custom/squirrel.custom.yaml ~/Library/Rime/squirrel.custom.yaml
	ln -s ~/.dotfiles/rime-custom/rime_ice.schema.custom.yaml ~/Library/Rime/rime_ice.custom.yaml


.PHONY: squirrel-custom-pure-f
squirrel-custom-pure-f:
	ln -sf ~/.dotfiles/rime-custom/default.custom.yaml ~/Library/Rime/default.custom.yaml
	ln -sf ~/.dotfiles/rime-custom/squirrel.custom.yaml ~/Library/Rime/squirrel.custom.yaml
	ln -sf ~/.dotfiles/rime-custom/rime_ice.schema.custom.yaml ~/Library/Rime/rime_ice.custom.yaml


.PHONY: squirrel-custom
squirrel-custom: squirrel squirrel-custom-pure


.PHONY: kitty-config
kitty-config:
	@mkdir -p ${HOME}/.config
	@ln -fs ${USER_DOTFILE_PATH}/kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
	@ln -fs ${USER_DOTFILE_PATH}/kitty/Catppuccin-Mocha.conf ${HOME}/.config/kitty/Catppuccin-Mocha.conf


.PHONY: rust
rust:
	@echo 'install rustup'
	@curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	@echo 'restore cargo config.toml'
	@mkdir -p ${HOME}/.config/cargo && ln -fs ${USER_DOTFILE_PATH}/rust/cargo/config.toml ${HOME}/.config/cargo/config.toml
	@echo 'install cargo-binstall'
	@cargo install cargo-binstall
	# @cargo binstall wasm-pack


.PHONY: phantom
phantom:

