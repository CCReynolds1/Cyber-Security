#!/bin/bash

# list the months
states=(
	'Tennessee'
	'Indiana'
	'Hawaii'
	'California'
	'Ohio'
	'Florida'
	'Georgia'
)

for states in ${states[@]};
do
	if  [ $states = 'Hawaii' ];
	then
		echo "Hawaii is the best!"
	else
		echo "im not fond of Hawaii."
	fi
done


