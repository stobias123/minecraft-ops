#!/bin/bash

echo "in this entrypoint"

# usage function
function usage()
{
   cat << HEREDOC

   Usage: $progname [--debug ]

   optional arguments:
     -h, --help           show this help message and exit
     -d, --debug DEBUG        are we in debug mode.

HEREDOC
}

# initialize variables
progname=$(basename $0)

while true; do
  # uncomment the next line to see how shift is working
  # echo "\$1:\"$1\" \$2:\"$2\""
  case "$1" in
    -h | --help ) usage; exit; ;;
    -d | --debug ) num_str="$2"; shift 2 ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

debug_args=""

java -Xms512m -Xmx1024m -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar spigot-1.14.3.jar nogui