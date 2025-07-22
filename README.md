# .dotfiles

```
$ git clone git@git.sr.ht:~razzi/.dotfiles ~/.dotfiles
```

## fish

Config from this repo is added to <https://git.sr.ht/~razzi/fish-functions>.

See <https://razzi.abuissa.net/2023/10/11/gitignore-and-symlinks>.

```
# fish will create some default files in this directory
# so we have to remove it before cloning.
# Be careful not to remove your own config
$ rm -r ~/.config/fish

$ git clone git@git.sr.ht:~razzi/fish-functions ~/.config/fish
$ symlink ~/.dotfiles/fish_conf.d ~/.config/fish/conf.d
```

## git

```
$ link-rc .gitconfig
```

## keyd

```
$ sudo ln -s (pwd)/keyd_config /etc/keyd
```

## rg

```
$ ln -s (pwd)/.rgrc $HOME/.rgrc

## Set in .profile
export RIPGREP_CONFIG_PATH=$HOME/.rgrc
```

## sway

```
ln -s (pwd)/sway.conf ~/.config/sway/config
```

## kitty

```
ln -s $(pwd)/kitty.conf ~/.config/kitty/
```

## tmux

```
ln -s $(pwd)/.tmux.conf ~
```
