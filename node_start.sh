#!/bin/bash
# This script initialize the node
# Put it in /etc/init.d/ and execute 
#   chmod +x /etc/init.d/node_start.sh
# if this does not run you have to create a symlink to /etc/rc.d/
#   ln -s /etc/init.d/start_my_app /etc/rc.d/

NB_START_PER_DAY=72

node_wd="/home/pi/workspace/"
node_start_count_file="start_count.txt"
cpp_filename="LeavesDetection"

################# VERIFICATIONS ################
# If the working directory is missing
if [ ! -d $node_wd ]; then
    mkdir $node_wd
	echo "Creating working directory..."$node_wd
fi

# If the pictures directory is missing
if [ ! -d $node_wd"camera" ]; then
    mkdir $node_wd"camera"
	echo "Creating camera directory: "$node_wd"camera"
fi

# if it is the first time the node is started
# and there is no "node_start_count_file" we make the file and write 0
if [ ! -f $node_wd$node_start_count_file ]; then
    echo "0" >> $node_wd$node_start_count_file
	start_count=0
	echo "Creating and initializing file: "$node_wd$node_start_count_file
else
	typeset -i start_count=$(cat $node_wd$node_start_count_file)
fi

# We increase the number in the file
echo $((start_count+1)) > $node_wd$node_start_count_file

########## CAMERA AND IMAGE DETECTION ########
# The picture is taken once per day

mod=$((start_count / NB_START_PER_DAY))
if ((start_count % NB_START_PER_DAY == 0)); then
	raspistill -vf -hf -o $node_wd"camera/vigne_"$mod.jpg
	cd $node_wd
	cmake .
	make
	echo "./"$cpp_filename $node_wd"camera/vigne_"$mod.jpg
	./$cpp_filename $node_wd"camera/vigne_"$mod.jpg
fi

####################  ####################


