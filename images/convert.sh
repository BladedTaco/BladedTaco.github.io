#!/bin/bash

regex="^Sanctum/(.*)_strip([0-9]+).png$"
fallbackregex="^Sanctum/(.*).png$"

for file in Sanctum/*.png; do
	num=1
	name="file"
	if [[ $file =~ $regex ]] 
	then
		name="${BASH_REMATCH[1]}"
		num="${BASH_REMATCH[2]}"
	else
		if [[ $file =~ $fallbackregex ]]
		then
			name="${BASH_REMATCH[1]}"
		else
			name="bad name"
		fi
	fi

	echo "$file"
	echo "name"
	echo "$num"

	width=$(identify -format '%w' $file)
	height=$(identify -format '%h' $file)

	echo "$width"
	echo "$height"

	wd=$((width/num))

	echo "$wd"

	command="convert -dispose previous $file -crop ${wd}x${height} +adjoin +repage -adjoin -loop 0 -delay 1 'Sanctum gifs/${name}.gif'"
	echo "$command"
	eval $command
done
