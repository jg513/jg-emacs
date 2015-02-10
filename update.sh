#!/bin/sh

# Copyright (C) Jin Gan <jg_513@163.com>

root_dir=$PWD/
cfg_file=~/.emacs

if [ ! -f $cfg_file ]; then
    echo "create \"$cfg_file.\""
cat << END > ~/.emacs
(load-file "${root_dir}.emacs")
END
else
    echo "\"$cfg_file\" exists."
fi

git_clone() {
    echo "update '$1'."
    if [ -d $1 ]; then
	content=`ls $1`
	if [ "$content" = "" ]; then
	    rm -rf $1
	    git clone $2 $1
	else
	    cd $1
	    git pull
	fi
    else
	git clone $2 $1
    fi
    cd $root_dir
}

# fetch for auto-complete
auto_complete_dir="auto-complete"
auto_complete_repo="https://github.com/auto-complete/auto-complete.git"

git_clone $auto_complete_dir $auto_complete_repo

# fetch for distel
distel_dir="distel"
distel_repo="https://github.com/massemanet/distel.git"

git_clone $distel_dir $distel_repo

# fetch for popup
popup_dir="popup"
popup_repo="https://github.com/auto-complete/popup-el.git"

git_clone $popup_dir $popup_repo

# fetch for yasnippet
yasnippet_dir="yasnippet"
yasnippet_repo="https://github.com/capitaomorte/yasnippet.git"

git_clone $yasnippet_dir $yasnippet_repo

# fetch for yasnippet snippets
snippets_dir="snippets"
snippets_repo="https://github.com/AndreaCrotti/yasnippet-snippets.git"

if [ ! -d $yasnippet_dir ]; then
    mkdir $yasnippet_dir
fi
cd $yasnippet_dir
git_clone $snippets_dir $snippets_repo

# fetch for sr-speedbar
sr_speedbar_dir="sr-speedbar"
sr_speedbar_repo="https://github.com/emacsmirror/sr-speedbar.git"

git_clone $sr_speedbar_dir $sr_speedbar_repo

# fetch for switch-window
switch_window_dir="switch-window"
switch_window_repo="https://github.com/dimitri/switch-window.git"

git_clone $switch_window_dir $switch_window_repo

# add .gitignore, keep this at last
echo "generate '.gitignore'."
cat << END > .gitignore
$auto_complete_dir/
$distel_dir/
$popup_dir/
$yasnippet_dir/
$sr_speedbar_dir/
$switch_window_dir/
END
echo "done."
