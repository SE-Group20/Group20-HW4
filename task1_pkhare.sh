#!/bin/bash

sh infinite_pkhare.sh &

sleep 0.1 # Still a good idea to let the process start

pkill -f "infinite_pkhare.sh"  # Kills all matching processes

if pgrep -f "infinite_pkhare.sh" > /dev/null; then
  echo "infinite_pkhare.sh is still running (something went wrong)."
else
  echo "infinite_pkhare.sh is no longer running."
fi
