#!/bin/bash

current_profile=$(powerprofilesctl get)

case $current_profile in
    performance)
        icon="life eater"
        ;;
    balanced)
        icon="chill guys"
        ;;
    power-saver)
        icon="useless"
        ;;
    *)
        icon="? wtf"
        ;;
esac

# Handle click events (optional: toggle profiles on click)
if [[ "$1" == "toggle" ]]; then
    case $current_profile in
        performance)
            powerprofilesctl set balanced
            ;;
        balanced)
            powerprofilesctl set power-saver
            ;;
        power-saver)
            powerprofilesctl set performance
            ;;
    esac
    current_profile=$(powerprofilesctl get)
fi

echo "{\"text\": \"$icon\", \"tooltip\": \"Current power profile: $current_profile\", \"class\": \"$current_profile\"}"
