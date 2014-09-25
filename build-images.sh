#!/usr/bin/env bash
#
# Builds images from all of the Dockerfiles in this repository.
#

# Exit on errors.
set -e 

# Some fancy, high-falutin' colours.
green='\e[0;32m'
cyan='\e[0;36m'
white='\e[1;37m'
reset='\e[0m'

# The list of images to build.
#
# First, we check to see if any image names were provided on the command line.
#
# Then, we are going to check for an IMAGES file in the current directory,
# and if it exists, we are going to use that as the ordered list of images
# to build.
#
# Otherwise, we are going to try and find all directories with a Dockerfile
# in them and go from that.
#
# The IMAGES file can contain blank lines, as well as comments, which should
# be on their own line, starting with a "#" character.
declare images
if [ ${#@} -gt 0 ]
then
	images="$@"
elif [ -e "IMAGES" ]
then
	images=$(cat IMAGES | sed -e '/^#/d' -e 's/^#//')
else
	images=$(find . -iname "Dockerfile" | sed -e 's/^\.\///' -e 's/Dockerfile$//')
fi

for img in $images
do
	pushd "$img" 2>&1 > /dev/null

	# We are going to allow for blank lines in the IMAGES file, so if we
	# come across a zero-length line, just skip the current iteration of
	# the loop.
	[ -z "$img" ] && continue

	imageversion="latest"
	if [ -e "VERSION" ]
	then
		version=$(cat "VERSION")
	fi

	echo -e "${green}=== ${white}Creating image $img${reset}"
	docker build -q --rm -t "$img:$version" .

	# If the image version is not marked as "latest", then create another
	# tag as "latest" so that it links to the image we just created.
	if [ "$version" != "latest" ]
	then
		echo -e "${cyan}==== ${white}Tagging $img:$version as latest${reset}"
		docker tag "$img:$version" "$img:latest"
	fi

	popd 2>&1 > /dev/null
done
