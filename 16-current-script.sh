#!/bin/bash

COURSE="Devops from Current Script"

echo "Before calling other script, course: $COURSE"
echo "Process ID of current script: $$"

# ./17-other-script.sh

source ./17-other-script.sh

echo "After calling other script, course: $COURSE"
