#!/bin/sh

set -e

command="apidoc $@"
input_directory=$(echo "$command" | grep -oE "\-(\-input|i)(\=| )[^ ]*" | tr "=" " " | cut -d " " -f2)

echo "ApiDoc command: ${command}"

until [ -d "${input_directory}" ]
do
  echo "Waiting for ${input_directory} to become available..."
  sleep 1s
done

echo "${input_directory} is ready"

init_inotifywait() {
  echo "Starting inotifywait to detect file change..."
  while inotifywait -e modify,move,create,delete $input_directory
  do
    echo "Files changed, rebuilding doc..."
    eval "${command}"
  done
}

init_inotifywait &

echo "Building documentation"

eval "${command}" &

while true
do
  tail -f /dev/null & wait ${!}
done
