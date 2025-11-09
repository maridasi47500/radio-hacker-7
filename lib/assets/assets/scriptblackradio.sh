#!/bin/bash
mypwd=$(pwd)
trap '{ ruby ./whattodoblackradio.rb; exit 1; }' INT
ruby ./whattodofirstblackradio.rb;
