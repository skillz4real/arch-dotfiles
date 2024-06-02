#!/bin/bash

is_second_monitor_connected() {
  xrandr | grep " connected" | grep -v primary | grep -v "^eDP" | grep -q -E "HDMI|DP|VGA"
}

start_main_polybar() {
  polybar 1 &
}

start_secondary_polybar() {
  if is_second_monitor_connected; then
    polybar 2 &
  else
    polybar 12 &
  fi
}

killall polybar

main() {
  sleep 3
  start_main_polybar
  start_secondary_polybar
}

main

