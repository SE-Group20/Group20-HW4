#!/bin/bash
    
# Finding PID of infinite loop of code file infinite.sh
pid=$(pgrep -f "infinite.sh")
# Kill the task
kill $pid