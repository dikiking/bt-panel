#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
install_tmp='/tmp/bt_install.pl'
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
download_Url=http://$nodeAddr

Install_safelogin()
{
	mkdir -p /www/server/panel/plugin/safelogin
	echo '正在安装脚本文件...' > $install_tmp
	wget -O /www/server/panel/plugin/safelogin/safelogin_main.py $download_Url/install/lib/plugin/safelogin/safelogin_main.py -T 5
	wget -O /www/server/panel/plugin/safelogin/index.html $download_Url/install/lib/plugin/safelogin/index.html -T 5
	wget -O /www/server/panel/plugin/safelogin/info.json $download_Url/install/lib/plugin/safelogin/info.json -T 5
	wget -O /www/server/panel/plugin/safelogin/icon.png $download_Url/install/lib/plugin/safelogin/icon.png -T 5
	echo '安装完成' > $install_tmp
	
}

Uninstall_safelogin()
{
	chattr -i /www/server/panel/plugin/safelogin/token.pl
	rm -f /www/server/panel/data/limitip.conf
	sed -i "/ALL/d" /etc/hosts.deny
	rm -rf /www/server/panel/plugin/safelogin
}


action=$1
host=$2;
if [ "${1}" == 'install' ];then
	Install_safelogin
else
	Uninstall_safelogin
fi
