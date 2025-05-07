#!/bin/sh

if [[ $(pidof waybar) -ne 0 ]]; then
    killall waybar
fi

waybar &
