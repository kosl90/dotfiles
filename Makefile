install = ln -fs `pwd`/$(1) ~/.$(1)

all:
	$(call install, gdb)
	$(call install, gdbinit)
	$(call install, toprc)
	$(call install, zshrc)
	$(call install, tmux.conf)
	$(call install, gitconfig)
	$(call install, astylerc)
	$(call install, rvmrc)
