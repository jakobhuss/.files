#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

olddir=~/dotfiles_old             # old dotfiles backup directory

########## Get paths to this script and this directory

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"                   # dotfiles directory
this_file=`basename "$0"`

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $(ls -A); do
  if [ $file != $this_file ] && [ $file != ".git" ] && [ ! -L ~/$file ]; then
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
  fi
done
