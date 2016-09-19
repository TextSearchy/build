#!/bin/sh

##################################################
##################################################
# 												 #
# 	  Copyright (c) 2016, TextSearchy Team		 #
# 			 All rights reserved.				 #
# 												 #
# 	TextSearchy Build Script alpha - v0.1		 #
# 												 #
##################################################
##################################################

#For Time Calculation
BUILD_START=$(date +"%s")

# Housekeeping
blue='\033[0;34m'
cyan='\033[0;36m'
green='\033[1;32m'
red='\033[0;31m'
nocol='\033[0m'

WORKING_DIRECTORY=$(pwd)
CORE="$WORKING_DIRECTORY/core_engine"
CONVERTOR="$WORKING_DIRECTORY/pdfConvertor"
OUT_DIR="$WORKING_DIRECTORY/out"
LIB_DIR="$OUT_DIR/lib"
########################
## Start Build Script ##
########################

mkdir -p $LIB_DIR

cd $CORE
echo "Entering Directory: $(pwd)"
echo "Building $blue CORE_ENGINE$nocol"
mkdir classes
javac -d "classes" "src/com/mmcoe/core/utils/StringFinder.java"
javac -d "classes" -classpath "classes" "src/com/mmcoe/core/Engine.java"
cd classes
echo "Main-Class: com.mmcoe.core.Engine" > manifest.txt
jar cvfm core_engine.jar manifest.txt *
cp core_engine.jar $OUT_DIR
echo "Building $blue CORE_ENGINE$nocol Finished"
echo "Leaving Directory: $(pwd)"
cd $WORKING_DIRECTORY

cd $CONVERTOR
echo "Entering Directory: $(pwd)"
echo "Building $blue CONVERTOR$nocol"
mkdir classes
javac -d "classes" -classpath "lib/pdfbox.jar" "src/com/mmcoe/pdfConvertor/utils/Convertor.java"
javac -d "classes" -classpath "classes" "src/com/mmcoe/pdfConvertor/PDFHandler.java"
cd classes
echo "Main-Class: com.mmcoe.pdfConvertor.PDFHandler" > manifest.txt
echo "Class-Path: lib/pdfbox.jar" >> manifest.txt
jar cvfm pdfConvertor.jar manifest.txt *
cp pdfConvertor.jar $OUT_DIR
echo "Copying Dependencies..."
cp ../lib/pdfbox.jar $LIB_DIR/
echo "Building $blue CORE_ENGINE$nocol Finished"
echo "Leaving Directory: $(pwd)"
cd $WORKING_DIRECTORY

BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo "$blue Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol"