#!/bin/bash
get_ip_addresses_to_array() {
    declare -a ip_catch_from_line;
    ##grep --extended-regexp "([0-9]{1,3}[\.]){3}[0-9]{1,3}" example_log.log >> massive2
        filename='apache_logs.txt'
        n=1
        while read line; do
            n=$((n+1))
			IFS=', ' read -r -a ip_catch_from_line <<< "$line";
			for i in "${ip_catch_from_line[@]}"
			do
			echo "READY " $i;
			echo ${ip_catch_from_line[0]} >> massive3;			
			done
		done < $filename;

		filename='example_log.log'	
        n=1
        while read line; do
            n=$((n+1))
			IFS=', ' read -r -a ip_catch_from_line <<< "$line";
			for i in "${ip_catch_from_line[@]}"
			do
			echo "READY " $i;
			echo ${ip_catch_from_line[0]} >> massive2;			
			done
        done < $filename 
}

searching_for_most_popular_elements() {
	cat  massive | tr " " "\n" | uniq -c
	cat  massive2 | tr " " "\n" | uniq -c
	cat  massive3 | tr " " "\n" | uniq -c
}


searching_for_unic_elements() {
	filename='massive'
        n=1
		declare -a unice_elements;
		declare -a sorted_unique_ids;
		declare -A counterr;

		max=0;
        while read line; do
        n=$((n+1))
		IFS=', ' read -r -a unic_elements <<< "$line";

		for i in "${unic_elements[@]}"
		do
		echo $i >> unicelements_massive_2;	
		done
        done < $filename
}



get_ip_addresses_to_array
searching_for_unic_elements 
searching_for_most_popular_elements