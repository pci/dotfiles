#!/bin/bash
git config --global user.name "Philip Ingrey"
# Very basic obfuscation
git config --global user.email $(echo "me"'@'"philingrey"'.'"com")
git config --global core.editor vim
git config --global push.default simple
git config --global color.ui true