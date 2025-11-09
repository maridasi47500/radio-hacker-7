#!/bin/bash
mypwd=$(pwd)
trap '{ ruby ./whattodonrjguyane.rb; exit 1; }' INT
ruby ./whattodofirstnrjguyane.rb;
