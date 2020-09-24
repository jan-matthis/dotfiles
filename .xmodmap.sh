#!/bin/bash

if command -v xmodmap &> /dev/null
then
  # Escape via right super
  xmodmap -e 'keycode 134 = Escape'

  # Umlaut through capslock
  xmodmap -e "keycode 66 = Mode_switch NoSymbol Mode_switch"
  xmodmap -e "clear mod5"
  xmodmap -e "add mod5 = ISO_Level3_Shift"
  xmodmap -e "keycode  30 = u U udiaeresis Udiaeresis"
  xmodmap -e "keycode  32 = o O odiaeresis Odiaeresis"
  xmodmap -e "keycode  38 = a A adiaeresis Adiaeresis"
  xmodmap -e "keycode  39 = s S ssharp S"

  # Space becomes shift if pressed in combination with another key, requires xcape
  if command -v xmodmap &> /dev/null
  then
    spare_modifier="Hyper_L"
    xmodmap -e "keycode 65 = $spare_modifier"
    xmodmap -e "remove mod4 = $spare_modifier" # hyper_l is mod4 by default
    xmodmap -e "add Shift = $spare_modifier"
    xmodmap -e "keycode any = space"
    xcape -e "$spare_modifier=space"
  fi

fi
