#!/bin/bash

Id() {
	echo -e "$(whoami)@$(cat /proc/sys/kernel/hostname)"
}

#Song() {
#	NP=$(ncmpcpp --current-song="%a - %t")
#	STATS=$(mpc | sed -n '1!p' | sed -n '2!p' | awk '{print $1}' | sed 's/[][]//g')
#	
#	if [[ $STATS == *"playing"* ]]; then
#			echo -e "\uf04b $NP"
#	elif [[ $STATS == *"pause"* ]]; then
#			echo -e "\uf04c $NP"
#	fi
#}

while true; do
		echo -e " %{l}  $(Id)"
		sleep 0.1s
done
