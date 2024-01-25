#!/bin/sh
echo -ne '\033c\033]0;ESCAPE THE SWARM\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/ESCAPE THE SWARM.x86_64" "$@"
