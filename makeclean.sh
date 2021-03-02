#!/bin/bash

# pdflatex file extensions
for ext in aux idx ilg ind log out toc; do
	find -name "*.${ext}" -delete
done

# Make a version for today
pdf=`find -name "*.pdf" -print | grep -v '\-'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].pdf`
if [ "${pdf}" != "" ]; then
	mv ${pdf} ${pdf%.pdf}-`date +%Y%m%d`.pdf
fi


