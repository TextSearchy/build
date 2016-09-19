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

########################
## Start Build Script ##
########################

mkdir out

cd $CORE
echo "Entering Directory: $(pwd)"

