#!/bin/bash
mypwd=$(pwd)
trap '{ ruby ./whattodo.rb; exit 1; }' INT
ruby ./whattodofirst.rb;
