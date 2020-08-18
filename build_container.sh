#!/bin/bash

set -eu

SCRIPT_ROOT="$(dirname "${BASH_SOURCE[0]}")"

function do_docker() {
    if ! [ -w "/run/docker.sock" ] ; then
        sudo -g docker /usr/bin/docker "${@}"
    else
        /usr/bin/docker "${@}"
    fi
}

pushd "${SCRIPT_ROOT}"

#do_docker login \
#    -u jkdingwall

do_docker build \
    -t "jkdingwall/z-demo" .

do_docker push \
    jkdingwall/z-demo:latest

popd
