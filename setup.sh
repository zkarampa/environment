#!/usr/bin/env bash

prefix="=====>"
path=`pwd`
dotfiles_dir="${path}/dotfiles"

echo "${prefix} Removing old stuff..."

declare -a files=("bashrc" "gitconfig" "gitignore_global")

for file in ${files[@]}; do
    if [[ -L ~/.${file} ]]; then
        rm ~/.${file}
    elif [[ -f ~/.${file} ]]; then
        mv ~/.${file} ~/.${file}.bak
    fi
done

echo "${prefix} Creating symlinks..."
for file in ${files[@]}; do
    if [[ ! -f ~/.${file} ]]; then
        ln -s ${dotfiles_dir}/${file} ~/.${file} > /dev/null
    fi
done


echo "${prefix} Reload your shell for changes to take place..."

exit 0
