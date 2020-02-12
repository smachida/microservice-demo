#!/bin/bash
JAVA_HOME=/usr/jdk/jdk-13.0.1

echo 'Runtime.getRuntime().availableProcessors()' | $JAVA_HOME/bin/jshell -q

$JAVA_HOME/bin/java -XX:+PrintFlagsFinal -version | grep MaxHeapSize
$JAVA_HOME/bin/java -Xmx200m -XX:+PrintFlagsFinal -version | grep MaxHeapSize


