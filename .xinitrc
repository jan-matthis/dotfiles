# Xresources
# https://wiki.archlinux.org/index.php/X_resources
[[ -f ~/.xresources ]] && xrdb -merge -I$HOME ~/.xresources

# Xmodmap
# https://wiki.archlinux.org/index.php/xmodmap
[[ -f ~/.xmodmap ]] && xmodmap ~/.xmodmap

# Cut/paste
#autocutsel -fork &
#autocutsel -selection PRIMARY -fork &

# Window manager
#xrandr --dpi 220
#exec i3
