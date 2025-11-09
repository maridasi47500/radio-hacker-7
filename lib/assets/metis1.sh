#!/bin/bash
mypwd=$(pwd)
trap '{ cd $mypwd & ruby ./metisfm.rb; }' EXIT
trap '{ ruby ./metisfm.rb; exit 1; }' INT
ruby ./metisfm.rb;
