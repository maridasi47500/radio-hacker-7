#!/bin/bash
mypwd=$(pwd)
# first argument : rss radio feed
# 2nd argument : radio numero
# 3rd argument : mp3 radio stream
#4nd argument : +/-
#5nd argument : +/- hours gmt
#6eme argument : +/- minute gmt



trap '{ ruby ./rsswhattodo.rb "$1" "$2" "$4" "$5" "$6"; exit 1; }' INT
#first argument = radio mp3 stream
#2nd argument = radio numero


ruby ./rsswhattodofirst.rb "$3" "$2";
