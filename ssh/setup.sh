#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# compile .ssh/config
cat ${DIR}/configs/** > ${HOME}/.ssh/config
chmod 600 ${HOME}/.ssh/config
