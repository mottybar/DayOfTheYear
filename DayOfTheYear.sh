#!/bin/bash

kind_of_year() {
local year=$1
if [[ $((year % 4)) -ne 0 ]];then
#	echo "common year"
		flag=1
elif [[ $((year % 100 )) -ne 0  ]];then
#	echo "leap year"
		flag=0
elif [[ $((year % 400)) -ne 0  ]];then
#	echo "common year"
		flag=1
else
#	echo "leap year"
		flag=0
fi
return $flag
}

#kind_of_year $1

number_of_days(){
local days_in_month=(31 28 31 30 31 30 31 31 30 31 30 31)
local year=$1
local month=$2
if  [[ $month -eq 2 ]] && kind_of_year $year -eq 0 ;then
#option2
#	if  kind_of_year $year == 0 ;then
		echo "29"
#	else
#		echo ${days_in_month[month-1]}
#	fi
else
	echo ${days_in_month[month-1]}

fi
#option3
#elif [[ $month =~ ^([13578]|1[02])$ ]];then
#	echo "31"
#else
#	echo "30"
#fi
}

#number_of_days $1 $2

day_of_the_year(){
local year=$1
local month=$2
local day=$3
local sum=0
for (( i=$month-1; i>=1; i-- ));do
	local days_in_month=$(number_of_days $year $i)
	echo $days_in_month
	sum=$((sum+days_in_month))
done
echo $((sum+day))
}

day_of_the_year $1 $2 $3
