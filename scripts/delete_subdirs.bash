#!/bin/bash
#
# This script might be useful for deleting directories in "$LFS/sources"
# after unpacking and compiling them

echo "List of directories:"
for entry in ./*; do
	if [ -d "$entry" ]; then
		echo "$entry"
	fi
done

read -p "Are you sure to delete these directories? [y/n] " user_input

case $user_input in
	y|yes)
		for entry in ./*; do
			if [ -d "$entry" ]; then
				rm -vrf "$entry"
			fi
		done
		echo "Done."
		;;
	n|no)
		echo "Operation cancelled."
		;;
	*)
		echo "Invalid input."
		exit 1
		;;
esac
