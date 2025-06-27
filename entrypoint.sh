#!/bin/sh

command=$1
env=$2
selectors=$3
echo "Command: $command, environment: $env, selectors: $selectors"

if [ -n "$env" ]; then
  env="-e $env"
fi

if [ -n "$selectors" ]; then
  selectors="-l $selectors"
fi

echo "Run helmfile with arguments: $command $env $selectors"
/usr/local/bin/helmfile $command $env $selectors
