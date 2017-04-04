#!/usr/bin/env bash

prefix="=====>"
path=`pwd`
dotfiles_dir="${path}/dotfiles"

declare -a files=("bashrc" "vimrc" "gitconfig" "gitignore_global")

echo "${prefix} Removing old stuff..."

for file in ${files[@]}; do
    if [[ -L ~/.${file} ]]; then # True if FILE exists and is a symbolic link.
        rm ~/.${file}
    elif [[ -f ~/.${file} ]]; then # True if FILE exists and is a regular file.
        mv ~/.${file} ~/.${file}.bak
    fi
done

echo "${prefix} Creating symlinks..."
for file in ${files[@]}; do
    if [[ ! -f ~/.${file} ]]; then  # True if NOT(FILE exists and is a regular file).
        ln -s ${dotfiles_dir}/${file} ~/.${file} > /dev/null
    fi
done

echo "${prefix} Reload your shell for changes to take place..."

exit 0
