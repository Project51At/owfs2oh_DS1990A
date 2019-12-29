#!/bin/bash
#@brief		The script notifies OpenHAB that the number of DS1990A ibutton devices has changed.
#@author	Helge Klug
#@copyright	Copyright (c) 2019 Helge Klug
#@version	1.00

#--------------------------------------------------------------------------------
# Configuration
OpenHabHost='http://localhost:8080'
OpenHabItem='KeyAccessControl_NumberOfDevices_DS1990A'

#--------------------------------------------------------------------------------
# register variable
NumberOfDevices_Reg='-'

#--------------------------------------------------------------------------------
ChangeOpenHabItem ()
#@brief		Change OpenHAB item via RestApi
#@param 	$1	Openhab host
#@param 	$2	Openhab item
#@param 	$2	Item value
{
    curl -X POST 	\
	--header "Content-Type: text/plain" \
	--header "Accept: application/json" \
	-d "$3" \
	"$1/rest/items/$2"
}

#--------------------------------------------------------------------------------
# Processing loop
while :

do
	# search for uncached devices with familycode 01
	# counter number of output lines
	NumberOfDevices=$(exec /usr/bin/owdir /uncached | grep /uncached/01 | sed "s/\/uncached\/01/01/" | wc -l)

	if [[ $NumberOfDevices == "" ]] ; then
		NumberOfDevices="0"
	fi;

	if [[ $NumberOfDevices != $NumberOfDevices_Reg ]]; then
		NumberOfDevices_Reg=$NumberOfDevices
		ChangeOpenHabItem $OpenHabHost $OpenHabItem $NumberOfDevices

		echo "Number of DS1990A devices changed: $NumberOfDevices" 
	fi;

	# do every second
	sleep 1
done
