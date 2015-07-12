#!/bin/sh

COMMAND_NOT_FOUND=/usr/share/doc/pkgfile/command-not-found.bash

if [ -e $COMMAND_NOT_FOUND ]; then
  source $COMMAND_NOT_FOUND
fi
