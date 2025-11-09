#!/bin/bash
mypwd=$(pwd)
#first argument : radio numero (id)
#2nd argument : +/-
#3nd argument : +/- hours gmt
#4eme argument : +/- minute gmt
#5th argument : radio stream (id)

trap '{ ruby ./jsonwhattodo.rb "$1" "$2" "$3" "$4"; exit 1; }' INT
ruby ./jsonwhattodofirst.rb "$5" "$1";
