#!/usr/bin/env bash

(
set -e
PS1="$"
basedir="$(cd "$1" && pwd -P)"
workdir="$basedir/work"
gitcmd="git -c commit.gpgsign=false"

updated="0"
function getRef {
    git ls-tree $1 $2  | cut -d' ' -f3 | cut -f1
}
function update {
    cd "$workdir/$1"
    $gitcmd fetch && $gitcmd clean -fd && $gitcmd reset --hard $2
    refRemote=$(git rev-parse HEAD)
    cd ../
    $gitcmd add $1
    refHEAD=$(getRef HEAD "$workdir/$1")
    echo "$1 $refHEAD - $refRemote"
    if [ "$refHEAD" != "$refRemote" ]; then
        export updated="1"
    fi
}

update Bukkit 8b6dd103832def3e8d1a7c3cdb98cde9826d543c
update CraftBukkit 656701746abf477beb78cb6108298b20dc053cf1
update Spigot 56f84710b85569a76df91e08104baa55000b565a
update Paper origin/ver/1.14

if [[ "$2" = "all" || "$2" = "a" ]] ; then
	update BuildData 2dbde4c18d3b3e34142da21d42cea4b1beb33d7d
	update Paperclip origin/master
fi
if [ "$updated" == "1" ]; then
    echo "Rebuilding patches without filtering to improve apply ability"
    cd "$basedir"
    scripts/rebuildPatches.sh "$basedir" nofilter 1>/dev/null|| exit 1
fi
)
