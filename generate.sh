#!/bin/bash

# Document vars
document="LinuxIntroductieVoorSysteembeheerders"

# Where are the images
# teTex input
TEXINPUTS=":images"
export TEXINPUTS

echo -n "First latex run... "
latex ${document}.tex 1>latex-1st.log
if [ $? != 0 ]; then
	echo "failed."
	exit 1
fi
echo "done."

# Build index if needed
if [ -f ${document}.idx ]; then
	echo -n "Creating index... "
	makeindex ${document}.idx 2>makeindex.log
	if [ $? != 0 ]; then
		echo "failed."
		exit 1
	fi
	echo "done."
fi

# Build DVI file
echo -n "Creating DVI file... "
latex ${document}.tex 1>latex-dvi.log
if [ $? != 0 ]; then
	echo "failed."
	exit 1
fi
echo "done."

# Create PDF
echo -n "Converting DVI to PDF... "
dvipdf ${document}.dvi 2>dvipdf-error.log
if [ $? != 0 ]; then
	echo "failed."
	exit 1
fi
echo "done."
