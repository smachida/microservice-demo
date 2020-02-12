#!/bin/bash
echo 'new byte[100_100_100]' | docker run -i --rm -m=1024M openjdk:12.0.2 jshell -q
echo 'new byte[500_100_100]' | docker run -i --rm -m=1024M openjdk:12.0.2 jshell -q

