#!/bin/bash


#variable
file ="~/Research2/sys_info.txt"


#Create an if statement that checks for the existence of the ~/research directory
if [ ! -d ~/Research2]
then
echo "Directory Research2 Exists"
else
        mkdir ~/Research2
echo "Directory ~/Research2 Created"
fi


#create an if statement to checks for the existence of the file ~/research/sys_info.txt.
if [ -f ~/Research2/sys_info.txt ]
echo "sys_info.txt found. Deleting now."
then
	rm ~/Research2/sys_info.txt
echo "sys_info.txt Removed."
fi






echo "A Script"
date
echo -e "The uname info is$(uname -a) \n"
echo -e "IP INFO: $(ip addr | head -9 | tail -1) /n"
echo -e "Hostname: $(hostname) /n"

sudo find /home -type f -perm 777 >> ~/research2/sys_info.txt
sudo ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> ~/research2/sys_info.txt

#list the permissions of the 2 files
perm=(
	'/etc/shadow'
	'/etc/passwd'
)

for perm in ${perm[@]}
do
	echo $(ls -la $[perm])
done



#list the sudo abilities of each user
users=(ls /home)

for sudo in $users
do
	sudo $sudo
done










