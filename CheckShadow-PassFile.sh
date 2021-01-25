#!/bin/bash
#This script shows if the shadow/passwd file exist on this machine and cat it, also allows you to search for specific users.
#Note: Super User privliages are requied to view files 

echo "This script searchs for the shadow and passwd file in /etc. It also allows you to search for a specific user."

read -p "Would you like to search for a specific user (y/n): " SEARCH_USR

if [ $SEARCH_USR = "y" ];
then 
	read -p "Please enter the user you would like to search for: " FIND_USR
else 
	echo "You have decided not to search for a specific user the entire shadow and passwd files will be printed if they exist"
fi 	

function test_shadow(){

	if [ -e /etc/shadow ];
	then 
		echo "There is a shadow file in /etc on this machine"
		if [ $SEARCH_USR = "y" ];
		then 	
			cat /etc/shadow | grep $FIND_USR
		else 
			cat /etc/shadow
		fi	
	else 
		echo "There is not a shadow file in /etc on this machine"

	fi	
}

function test_password(){
	if [ -e /etc/passwd ];
	then 
		echo "There is a passwd file in /etc on this machine"
		if [ $SEARCH_USR = "y" ];
		then 
			cat /etc/passwd | grep $FIND_USR
		else 
			cat /etc/passwd
		fi	
	else 
		echo "There is not a passwd file in /etc on this machine"
	fi	

}

test_shadow

test_password

