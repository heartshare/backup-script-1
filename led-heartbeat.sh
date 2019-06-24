#!/bin/bash

normal() {
  for i in {1..5}
  do
    echo 1 > /sys/class/leds/led1/brightness
    sleep 3
    echo 0 > /sys/class/leds/led1/brightness
    sleep 0.5
  done
}

panic() {
  echo 1 > /sys/class/leds/led1/brightness
  sleep 0.35
  echo 0 > /sys/class/leds/led1/brightness
  sleep 0.15

  echo 1 > /sys/class/leds/led1/brightness
  sleep 0.35
  echo 0 > /sys/class/leds/led1/brightness
  sleep 0.15

  echo 1 > /sys/class/leds/led1/brightness
  sleep 0.35
  echo 0 > /sys/class/leds/led1/brightness
  sleep 0.15

  sleep 0.75
}

for (( ; ; ))
do
  if systemctl is-active --quiet syncthing@ubuntu.service && ! systemctl is-failed --quiet backup.service && findmnt -M "/home/ubuntu/data" >/dev/null; then
    normal
  else
    panic
  fi
done
