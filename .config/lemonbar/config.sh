#!/bin/bash

Clock() {
	TIME=$(date "+%H:%M:%S")
	echo -e -n "${TIME}"
}

Battery() {
	BATTACPI=$(acpi --battery)
	BATPERC=$(echo $BATTACPI | cut -d, -f2 | tr -d '[:space:]')

	if [[ $BATTACPI == *"100%"* ]]; then
		echo -e -n "\uf00c $BATPERC"
	elif [[ $BATTACPI == *"Discharging"* ]]; then
		BATPERC=${BATPERC::-1}
		if [[ $BATPERC -le "10" ]]; then
			echo -e -n "\uf582"
		elif [[ $BATPERC -le "25" ]]; then
			echo -e -n "\uf57a"
		elif [[ $BATPERC -le "50" ]]; then
			echo -e -n "\uf57d"
		elif [[ $BATPERC -le "75" ]]; then
			echo -e -n "\uf57f"
		elif [[ $BATPERC -le "100" ]]; then
			echo -e -n "\uf578"
		fi
		echo -e " $BATPERC"
	elif [[ $BATTACPI == *"Charging"* && $BATTACPI != *"100%"* ]]; then
		echo -e "\uf583 $BATPERC"
	elif [[ $BATTACPI == *"Unknown"* ]]; then
		echo -e " $BATPERC"
	fi	
}

#Workspace() {
#	CURRENT=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
#	#echo -e "$CURRENT" <--- for testing
#
#	if [[ $CURRENT == 0 ]]; then
#		echo "I"
#	elif [[ $CURRENT == 1 ]]; then
#		echo "II"
#	elif [[ $CURRENT == 2 ]]; then
#		echo "III"
#	elif [[ $CURRENT == 3 ]]; then
#	echo "IV"
#	fi
#}

while true; do
	echo -e  " %{r} $(Battery)  $(Clock) "
	sleep 0.1s
done
