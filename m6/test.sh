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

most_requested_page() {
	echo "Most requested page";

# variables
LOGFILE="apache_logs.txt"
LOGFILE_GZ="/example_log.log"
RESPONSE_CODE="200"

# functions
filters(){
grep $RESPONSE_CODE \
| grep -v "\/rss\/" \
| grep -v robots.txt \
| grep -v "\.css" \
| grep -v "\.jss*" \
| grep -v "\.png" \
| grep -v "\.ico"
}

filters_404(){
grep "404"
}

request_ips(){
awk '{print $1}'
}

request_method(){
awk '{print $6}' \
| cut -d'"' -f2
}

request_pages(){
awk '{print $7}'
}

wordcount(){
sort \
| uniq -c
}

sort_desc(){
sort -rn
}

return_kv(){
awk '{print $1, $2}'
}

request_pages(){
awk '{print $7}'
}

return_top_ten(){
head -10
}

## actions
get_request_ips(){
echo ""
echo "Top 10 Request IP's:"
echo "===================="

cat $LOGFILE \
| filters \
| request_ips \
| wordcount \
| sort_desc \
| return_kv \
| return_top_ten
echo ""
}

get_request_methods(){
echo "Top Request Methods:"
echo "===================="
cat $LOGFILE \
| filters \
| request_method \
| wordcount \
| return_kv
echo ""
}

get_request_pages_404(){
echo "Top 10: 404 Page Responses:"
echo "==========================="
zgrep '-' $LOGFILE $LOGFILE_GZ\
| filters_404 \
| request_pages \
| wordcount \
| sort_desc \
| return_kv \
| return_top_ten
echo ""
}


get_request_pages(){
echo "Top 10 Request Pages:"
echo "====================="
cat $LOGFILE \
| filters \
| request_pages \
| wordcount \
| sort_desc \
| return_kv \
| return_top_ten
echo ""
}

get_request_pages_all(){
echo "Top 10 Request Pages from All Logs:"
echo "==================================="
zgrep '-' --no-filename $LOGFILE $LOGFILE_GZ \
| filters \
| request_pages \
| wordcount \
| sort_desc \
| return_kv \
| return_top_ten
echo ""
}

}


get_ip_addresses_to_array
searching_for_unic_elements 
searching_for_most_popular_elements
most_requested_page

# executing
get_request_ips
get_request_methods
get_request_pages
get_request_pages_all
get_request_pages_404