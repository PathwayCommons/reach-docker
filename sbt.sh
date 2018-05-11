#!/bin/bash

SBT_OPTS="-Xmx8G -Xms4G"
exec java $SBT_OPTS -jar reach-1.4.1-SNAPSHOT-FAT.jar
