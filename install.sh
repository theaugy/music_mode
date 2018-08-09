#!/bin/bash

cp -v ${0%/*}/music_mode "$HOME/.music_mode"
echo "Source $HOME/.music_mode into any shell to enable music mode. This action is idempotent."
