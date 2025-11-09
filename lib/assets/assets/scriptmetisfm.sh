#!/bin/bash
mypwd=$(pwd)
trap '{ ruby ./whattodometisfm.rb; exit 1; }' INT
ruby ./whattodofirstmetisfm.rb;
