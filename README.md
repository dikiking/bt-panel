<center>
    <img src="https://www.bt.cn/bbs/newsimg/5.3.jpg" alt="bt-panel">
</center>

简单好用的 Linux/Windows 面板。

Linux版请确保纯净系统安装（支持 CentOS、Ubuntu、Debian、Fedora），Web端管理，QQ群及论坛技术支持
一键创建网站、FTP、数据库、SSL；安全管理，计划任务，文件管理，PHP多版本共存及切换；自带 LNMP 与 LAMP。

Windows版支持 2003(x86)/2008(x64)/2012/2016 系统，支持Web端与软件端同步管理，QQ群及论坛技术支持
一键创建网站、FTP、数据库；安全管理，文件管理，PHP多版本共存及切换；ASP+ASPX+PHP+MYSQL+MSSQL05/08+mariaDB+FTP。

Windows版请查看：[Windows面板](https://www.bt.cn/download/windows.html)

# 环境要求

## Linux面板环境要求

- 支持 CentOS、Ubuntu、Debian、Fedora 系统；
- 确保是干净的操作系统，没有安装过其它环境带的 Apache/Nginx/php/MySQL 等程序；
- 内存要求最低128MB，推荐 512MB 以上，纯面板约占系统 10MB 内存；
- 如果以上条件不能满足，将无法安装成功和使用，请安装前注意核查；

## Windows面板环境要求

- 操作系统：支持 2003(x86)/2008(x64)/2012/2016；
- 环境需求：Microsoft .NET Framework 2.0；
- 内存要求：内存要求最低1G，推荐1G以上内存；



# 开始使用

## 克隆代码

`git clone https://github.com/OSI-LTD/bt-panel.git`

## 一键安装

### CentOS

```
cd bt-panel
sh install.sh
```

### Ubuntu/Debian

```
cd bt-panel
sudo bash install.sh
```

### Debian/Fedora

```
cd bt-panel
bash install.sh
```

## 升级更新

```
cd /www/server/panel
sh update.sh 5.3.0
```

若点击更新后没生效，请尝试重启面板服务：

`service bt restart`

# 常用命令

宝塔 4.x 服务管理

## 停止

`service bt stop`

## 启动

`service bt start`

## 重启

`service bt restart`

## 卸载4.x面板

`service bt stop && chkconfig --del bt && rm -f /etc/init.d/bt && rm -rf /www/server/panel`

## 查看当前面板端口

`cat /www/server/panel/data/port.pl`

## 命令行修改面板端口，如要改成8881（centos 6）

```
echo '8881' > /www/server/panel/data/port.pl && service bt restart
iptables -I INPUT -p tcp -m state --state NEW -m tcp --dport 8881 -j ACCEPT
service iptables save
service iptables restart
```

## 命令行修改面板端口，如要改成8881（centos 7）

```
echo '8881' > /www/server/panel/data/port.pl && service bt restart
firewall-cmd --permanent --zone=public --add-port=8881/tcp
firewall-cmd --reload
```

## 强制修改MySQL管理(root)密码，如要改成123456

`cd /www/server/panel && python tools.pyc root 123456`

## 命令行修改面板密码，如要改成123456

`cd /www/server/panel && python tools.pyc panel 123456`

## 站点配置文件位置

`/www/server/panel/vhost`

## 删除面板域名绑定

`rm -f /www/server/panel/data/domain.conf`

## 清理登陆限制

`rm -f /www/server/panel/data/*.login`

## 第三方应用服务名称

- nginx: nginx
- apache: httpd
- pure-ftpd: pure-ftpd
- php5.2: php-fpm-52
- php5.3: php-fpm-53
- php5.4: php-fpm-54
- ... 以此类推

## php.ini位置，如php5.4的

`/www/server/php/54/etc/php.ini`

## my.cnf位置

`/etc/my.cnf`

# 软件列表

- Nginx-Tengine-2.2.0
- Nginx1.8 - 1.10
- Apache2.4.20
- PHP5.2 - 7.1（安装时可选，支持多版本共存，除 php7、php7.1 都已包含 zendloader）
- MySQL5.5 - 5.7（安装时可选）
- Pure-Ftpd
- phpMyadmin
- OpenResty
- WEB在线面板 

# 特色功能

- 一键配置服务器环境（LAMP/LNMP）
- 一键安全重启
- 一键创建管理网站、ftp、数据库
- 一键配置（定期备份、数据导入、伪静态、301、SSL、子目录、反向代理、切换PHP版本）
- 一键安装常用PHP扩展(fileinfo、intl、opcache、imap、memcache、apc、redis、ioncube、imagick)
- 数据库一键导入导出
- 系统监控（CPU、内存、磁盘IO、网络IO）
- 防火墙端口放行
- SSH开启与关闭及SSH端口更改
- 禁PING开启或关闭
- 方便高效的文件管理器（上传、下载、压缩、解压、查看、编辑等等）
- 计划任务（定期备份、日志切割、shell脚本）
- 软件管理（一键安装、卸载、版本切换）

# 常见问题

## 端口未放行

以下云服务商，安装面板后需开端口，不开启将无法使用。

- 腾讯云：https://www.bt.cn/bbs/thread-1229-1-1.html
- 阿里云：https://www.bt.cn/bbs/thread-2897-1-1.html
- 华为云：https://www.bt.cn/bbs/thread-3923-1-1.html

## Linux面板忘记密码

命令输入这段命令，然后在最后输入新密码。

`cd /www/server/panel && python tools.pyc panel 此处填写新密码`

## Linux面板清除登录限制

如果提示多次登录失败，暂时禁止登录 请输入以下命令 清除登录限制。

`rm -f /www/server/panel/data/*.login`

## Linux面板删除域名绑定面板

如果当前面板限制域名登录，需要取消域名绑定，可执行以下命令，即可清除域名绑定。

`rm -f /www/server/panel/data/domain.conf`

## Linux面板关闭ip访问限制

如果当前面板限制登录IP地址，可以使用以下命令清除限制。

`rm -f /www/server/panel/data/limitip.conf`

了解更多，请查阅：[宝塔面板手册](http://docs.bt.cn/424204)

# 许可协议

    Copyright (c) 2015-2016 宝塔软件(http://bt.cn) All rights reserved.