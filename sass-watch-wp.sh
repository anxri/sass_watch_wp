#!/bin/bash
echo "Creating Sass Watches.\n"
files=( * )

for file in "${files[@]}"; do
	extension="${file##*.}"
	fullname="$file"
	filename="${file%.*}"
	
	if [ "$extension" == "scss" ]; then
        	echo "watching: $fullname"
		if [ "$filename" == "style" ]; then
			sass --watch $filename.scss:../$filename.css &
		else
			sass --watch $filename.scss:../css/$filename.css &
		fi
	fi
	
done
