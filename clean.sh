#!/bin/sh

##################################################
##################################################
# 												 #
# 	  Copyright (c) 2016, TextSearchy Team		 #
# 			 All rights reserved.				 #
# 												 #
# 	TextSearchy Clean Script alpha - v0.1		 #
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
OUT_LIB_ONLY="$OUT_DIR/ENGINE"
OUT_LIB_ONLY_LIB_DIR="$OUT_LIB_ONLY/lib"
PARA_SENTENCE="$WORKING_DIRECTORY/tools/prebuilts/ParaToSentence/ParaToSentence.py"
OUT_SCRIPTS="$OUT_LIB_ONLY/scripts/"

# ADD SAMPLE VARIABLES
OUT_WEB="$OUT_DIR/website"
SAMPLE_WEB="$WORKING_DIRECTORY/samples/website/web"

########################
## Start Clean Script ##
########################

cd $CORE
echo "Entering Directory: $(pwd)"
echo "Cleaning $blue CORE_ENGINE$nocol"
rm -rf classes
echo "Cleaning $blue CORE_ENGINE$nocol Finished"
echo "Leaving Directory: $(pwd)"
cd $WORKING_DIRECTORY

cd $CONVERTOR
echo "Entering Directory: $(pwd)"
echo "Building $blue CONVERTOR$nocol"
rm -rf classes
echo "Building $blue CORE_ENGINE$nocol Finished"
echo "Leaving Directory: $(pwd)"
cd $WORKING_DIRECTORY
rm -rf $OUT_DIR
echo "Entire out directory removed"

BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo "$green Clean completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol"
echo ""