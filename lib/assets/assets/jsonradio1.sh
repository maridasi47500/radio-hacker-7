#!/bin/bash
mypwd=$(pwd)
#first argum=flux json des titre precedent suivant

ruby ./jsonradio.rb "$1" "$2";
