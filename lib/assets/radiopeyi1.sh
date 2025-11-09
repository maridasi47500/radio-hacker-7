#!/bin/bash
mypwd=$(pwd)
trap '{ cd $mypwd & ruby ./radiopeyi.rb; }' EXIT
trap '{ ruby ./radiopeyi.rb; exit 1; }' INT
ruby ./radiopeyi.rb;
