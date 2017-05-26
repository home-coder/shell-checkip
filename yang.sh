 #! /bin/bash

 checkip() {
	 if echo $1 |egrep -q '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$' ; then
		 a=`echo $1 | awk -F. '{print $1}'`
		 b=`echo $1 | awk -F. '{print $2}'`
		 c=`echo $1 | awk -F. '{print $3}'`
		 d=`echo $1 | awk -F. '{print $4}'`
		 for n in $a $b $c $d; do
			 if [ $n -ge 255 ] || [ $n -le 0 ]; then
				 echo "the number of the IP should less than 255 and greate than 0"
				 return 2
			 fi
		 done
	 else
		 echo "The IP you input is something wrong, the format is like 192.168.100.1"
		 return 1
	 fi
 }
 
 rs=1
 while [ $rs -gt 0 ]; do
	 read -p "Please input the ip:" ip
	 checkip $ip
	 rs=`echo $?`
 done
 echo "The IP is right!"
