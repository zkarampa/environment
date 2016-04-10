#!/usr/bin/env bash

prefix="=====>"
path=`pwd`
dotfiles_dir="${path}/dotfiles"

echo "${prefix} Removing old stuff..."

file="bashrc"

if [[ -L ~/.${file} ]]; then
    rm ~/.${file}
elif [[ -f ~/.${file} ]]; then
    mv ~/.${file} ~/.${file}.bak
fi

echo "${prefix} Creating symlinks..."
if [[ ! -f ~/.${file} ]]; then
    ln -s ${dotfiles_dir}/${file} ~/.${file} > /dev/null
fi

echo "${prefix} Reload your shell for changes to take place..."

exit 0
