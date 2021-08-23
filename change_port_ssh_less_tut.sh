#!/bin/bash
function pause(){
   read -p "$*"
}
#
# 
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
echo "                          Bạn vừa đổi Port SSH VPS";
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
find . -name "change_port_ssh_less_tut.sh" -delete;
find . -name "csf_install.sh" -delete;
history -c;
reboot
