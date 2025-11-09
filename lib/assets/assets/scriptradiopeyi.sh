#!/bin/bash
mypwd=$(pwd)
trap '{ ruby ./whattodoradiopeyi.rb; exit 1; }' INT
ruby ./whattodofirstradiopeyi.rb;
