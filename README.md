# .dotfiles

```
$ git clone git@git.sr.ht:~razzi/.dotfiles ~/.dotfiles
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

## fish

Config from this repo is added to <https://git.sr.hut/~razzi/fish-functions>.

See <https://razzi.abuissa.net/2023/10/11/gitignore-and-symlinks>.

```
$ git clone git@git.sr.ht:~razzi/fish-functions ~/.config/fish
$ symlink fish_conf.d ~/.config/fish/conf.d
```

## kitty

```
ln -s $(pwd)/kitty.conf ~/.config/kitty/
```

## tmux

```
ln -s $(pwd)/.tmux.conf ~
```
