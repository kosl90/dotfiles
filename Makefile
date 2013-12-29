files = gdb gdbinit toprc zshrc tmux.conf gitconfig astylerc rvmrc
install = ln -fs `pwd`/$(1) ~/.$(1);

all:
	$(foreach file, $(files), $(call install, $(file)))
