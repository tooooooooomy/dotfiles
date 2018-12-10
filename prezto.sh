#!/usr/local/bin/zsh

########################################
#
# Author:
# Last Change: 23-Jun-2018.
#
# Ref:
#
########################################

echo ${ZDOTDIR:-$HOME}/.zprezto/runcoms/^README.md
for rcfile in ${ZDOTDIR:-$HOME}/.zprezto/runcoms/^README.md; do
  echo $rcfile
  #ln -s \"$rcfile\" \"${ZDOTDIR:-$HOME}/.${rcfile:t}\"
done
