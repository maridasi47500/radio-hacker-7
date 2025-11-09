#!/bin/bash
mypwd=$(pwd)
trap '{ cd $mypwd & ruby ./blackradio.rb; }' EXIT
trap '{ ruby ./blackradio.rb; exit 1; }' INT
ruby ./blackradio.rb;
