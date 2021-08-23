#!/bin/bash
function pause(){
   read -p "$*"
}
#
# 
cd /usr/local/directadmin/conf/;
vi directadmin.conf;
killall -9 directadmin;
/etc/init.d/directadmin start;
systemctl restart directadmin.service;
wget http://files.directadmin.com/services/all/csf/csf_install.sh;
/bin/sh ./csf_install.sh;
vi /etc/csf/csf.conf;
csf -r;
echo "==============================================================================";
echo "            Chúc mừng bạn đã Khai báo / Mở Port Direct Admin thành công ^^ ";
echo "";
echo "                Cảm ơn bạn đã tin tưởng và sử dụng Script nhỏ này ^^";
echo "";
echo "             Để ĐỔI PORT SSH VPS nhấn ENTER, để thoát nhấn CTRL + C";
echo "==============================================================================";
pause '                      Nhấn [Enter] để ĐỔI PORT SSH VPS...';
echo "==============================================================================";
echo "";
printf \\a
sleep 1
printf \\a
sleep 1
printf \\a
vi /etc/sysconfig/selinux;
sestatus;
yum update -y;
vi /etc/ssh/sshd_config;
systemctl restart sshd.service;
yum install net-tools -y;
netstat -tupln;
vi /etc/csf/csf.conf;
csf -r;
echo "==============================================================================";
echo "                      CHÚC MỪNG BẠN MỌI THỨ ĐÃ XONG ^^ ";
echo "";
echo "                 Bạn vừa đổi Port Direct Admin và Port SSH VPS";
echo "";
echo " ";
echo "                    BẠN CẦN NHỚ PORT ĐÓ TRONG QUÁ TRÌNH SỬ DỤNG";
echo "                 Để hoạt động tốt nhất, bạn cần KHỞI ĐỘNG LẠI VPS";
echo "";
echo "                Bạn muốn khởi động lại sau, nhấn CTRL + C để thoát";
echo "==============================================================================";
pause '                      Nhấn [Enter] để KHỞI ĐỘNG LẠI...';
echo "==============================================================================";
echo "";
cd /
find . -name "change_da_ssh_port_less.sh" -delete;
find . -name "csf_install.sh" -delete;
history -c;
reboot
