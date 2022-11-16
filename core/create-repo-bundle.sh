#!/bin/bash
cd "$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)"
tar -C descriptors --uid=0 --gid=0 --numeric-owner -cvjf core.tar.bz2 .
