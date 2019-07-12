# Intro

My some configure files.

## Configure for

* top
* gdb
* zsh
* ghci
* astyle
* tmux
* rvmrc
* git
* nvm
* npm
* condarc
* gtk
* rvm

some configurations will inject some source code into shell rc file like .zshrc,
please make sure you are running the correct shell.

## Env Vars
- `DISABLE_NVM_AUTOLOAD_NVMRC` empty for enable autoload

## Quick start

`make` will install zsh config, vim config, nvm and some other config files.

if zsh is installed, `make chsh` will change the default shell to zsh.

## compile vim

**installing vim from repository is fine, the vim in repository is vim8 now.**

if `--disable-gui`, `--enable-xim` is useless

```shell
./configre --prefix=/usr --disable-gui --enable-cscope --enable-fontset \
   --enable-largefile --enable-multibyte  --with-features=huge --with-x\
      --enable-pythoninterp=yes \
      --with-python-config-dir=/usr/lib/python2.7/config-i386-linux-gnu/ \
      --enable-rubyinterp=yes \
      --with-luajit --enable-luainterp=yes
      may use dynamic
```

either python2 or python3

if python2 and python3 both are installed, `dynamic` cannot be used.

```shell
--with-python3-config-dir=/usr/lib/python3.3/config-3.3m-i386-linux-gnu --enable-python3interp=dynamic
```

install vim dependencies in ubuntu

```shell
apt-get install lua5.1 luajit perl python-dev libperl-dev liblua5.1-0-dev libx11-dev libluajit-5.1-dev libacl1-dev libxt-dev
```

### set default editor in ubuntu

```shell
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
```

## License

[MIT License](http://opensource.org/licenses/MIT)
