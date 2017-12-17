#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

CN='1.btnode.cn'
HK='2.btnode.cn'
US='3.btnode.cn'
sleep 0.5;
CN_PING=`ping -c 1 -w 1 $CN|grep time=|awk '{print $7}'|sed "s/time=//"`
HK_PING=`ping -c 1 -w 1 $HK|grep time=|awk '{print $7}'|sed "s/time=//"`
US_PING=`ping -c 1 -w 1 $US|grep time=|awk '{print $7}'|sed "s/time=//"`

echo "$HK_PING $HK" > ping.pl
echo "$US_PING $US" >> ping.pl
echo "$CN_PING $CN" >> ping.pl
nodeAddr=`sort -V ping.pl|sed -n '1p'|awk '{print $2}'`
if [ "$nodeAddr" == "" ];then
	nodeAddr=$HK
fi
serverUrl=http://$nodeAddr/install
mtype=$1
actionType=$2
name=$3
version=$4

if [ ! -f 'lib.sh' ];then
	wget -O lib.sh $serverUrl/$mtype/lib.sh
fi
wget -O $name.sh $serverUrl/$mtype/$name.sh
if [ "$actionType" == 'install' ];then
	sh lib.sh
fi
sh $name.sh $actionType $version
