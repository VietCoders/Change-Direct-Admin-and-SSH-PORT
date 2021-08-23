#!/bin/bash
function pause(){
   read -p "$*"
}
#
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
echo "             Để KHỞI ĐỘNG LẠI VPS nhấn ENTER, để thoát nhấn CTRL + C";
echo "==============================================================================";
pause '                      Nhấn [Enter] để KHỞI ĐỘNG LẠI VPS...';
echo "==============================================================================";
echo "";
cd /
find . -name "change_port_direct_admin.sh" -delete;
find . -name "csf_install.sh" -delete;
history -c;
reboot
