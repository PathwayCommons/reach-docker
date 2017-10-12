#!/bin/bash

SBT_OPTS="-Xmx6G -Xms4G"
exec java $SBT_OPTS -jar reach-1.3.5-SNAPSHOT-FAT.jar
