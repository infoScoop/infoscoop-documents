#!/bin/sh
# How to Use this script
# Place this file, mkdown-to-html.sh to the directory that includes "user-guide" directory.
# "user-guide" directory can be other guide like administration-guide and technical-specifications.
# Edit this file and change the directory name if needed.
# Run this file and you'll see the html files in dist directory.

# Create "dist" directory if it doesn't exists.
if [ ! -e dist ]; then
mkdir dist
fi

# Copy the directory structure of "user-guide" directory. (Files are not to be copied.)
find user-guide -type d | xargs -I dir mkdir dist/dir

# Convert md files to html files
find ./ -iname "*.md" -type f | while read FILE
do

path=${FILE#./}
string_filename=${path##*/}
string_filename_without_extension=${string_filename%.*}
string_path=${path%/*}
html_path=${string_path#input}
html_file_name=${string_filename_without_extension}.html
html_output_path=${html_path}/${html_file_name}

echo "##File Info##"
echo $path
echo ${string_filename}
echo ${string_filename_without_extension}
echo ${string_path}
echo $html_path
echo $html_file_name
echo "output path"
echo $html_output_path
echo "#############"

pandoc $path -s -c ../../../../manual.css  -t html -o ./dist/${html_output_path}

done

# Replace ".md" to ".html" in each output files.
find ./dist/ -type f -exec sed -i "s/\.md/\.html/g"  {} \;
