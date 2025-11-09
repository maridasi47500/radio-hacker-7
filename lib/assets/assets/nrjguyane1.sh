#!/bin/bash
mypwd=$(pwd)
trap '{ cd $mypwd & ruby ./nrjguyane.rb; }' EXIT
trap '{ ruby ./nrjguyane.rb; exit 1; }' INT
ruby ./nrjguyane.rb;
