# Xresources
# https://wiki.archlinux.org/index.php/X_resources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Xmodmap
# https://wiki.archlinux.org/index.php/xmodmap
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Cut/paste
#autocutsel -fork &
#autocutsel -selection PRIMARY -fork &

# Window manager
#xrandr --dpi 220
#exec i3
