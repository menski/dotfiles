#!/bin/bash

export DISPLAY=:0.0
export XAUTHORITY=/home/menski/.Xauthority

INTERN="LVDS1"
EXTERN="HDMI3"
EXTERN2="HDMI2"
DOCK="DP2"
BEAMER="VGA1"
MODE="${1-1024x768}"

XRANDR="$(xrandr -q)"

if [[ $XRANDR =~ "$EXTERN connected" ]]; then
  xrandr --output $INTERN --off --output $EXTERN --auto
elif [[ $XRANDR =~ "$DOCK connected" ]]; then
  xrandr --output $INTERN --off --output $DOCK --auto
elif [[ $XRANDR =~ "$EXTERN2 connected" ]]; then
  xrandr --output $INTERN --same-as $EXTERN2 --output $EXTERN2 --auto
elif [[ $XRANDR =~ "$BEAMER connected" ]]; then
  xrandr --output $INTERN --mode $MODE --output $BEAMER --same-as $INTERN --mode $MODE >> /tmp/hotplug.txt 2>&1
else
  xrandr --output $EXTERN --off --output $BEAMER --off --output $DOCK --off --output $INTERN --auto
fi
