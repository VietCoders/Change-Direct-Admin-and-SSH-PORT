#!/bin/bash
function pause(){
   read -p "$*"
}
#
# 
echo "==============================================================================";
echo "                 Xin chào - Chúc một ngày tốt lành tới Bạn ^^ ";
echo "   Cảm ơn bạn đã sử dụng Scripts nhỏ này của tôi để thay đổi Port Direct Admin";
echo "";
echo "  Tại giao diện chỉnh sửa tệp cấu hình, các bạn hãy tìm dòng port= để chỉnh sửa";
echo "      -  Nếu không có dòng này hãy thêm ở dưới cùng theo ví dụ dưới đây  -";
echo "                                 port=6969";
echo "         Trong đó port= là khai báo Port còn 6969 là Port bạn muốn thay đổi.";
echo "";
echo "        Sau khi File mở ra bạn nhấn i để sửa đổi, bạn cũng có thể nhấn Insert";
echo "           Sau khi thêm, sửa xong. Bạn nhấn ESC, tiếp theo nhấn :wq để thoát";
echo "==============================================================================";
pause '                      Nhấn [Enter] để tiếp tục...';
echo "==============================================================================";
echo "";
# 
cd /usr/local/directadmin/conf/;
vi directadmin.conf;
killall -9 directadmin;
/etc/init.d/directadmin start;
systemctl restart directadmin.service;
wget http://files.directadmin.com/services/all/csf/csf_install.sh;
/bin/sh ./csf_install.sh;
echo "==============================================================================";
echo "              Chúc mừng bạn đã Khai báo / Mở Port thành công ^^ ";
echo "         Tuy nhiên bạn cần mở chặn trong Firewall để sử dụng port này";
echo "";
echo "";
echo "           Trong file chuẩn bị được mở dưới đây bạn chú ý mục sau:";
echo "   Bạn kéo xuống dưới cùng phần PORTS_directadmin = Bạn thêm PORT SSH vào tương ứng";
echo "";
echo "                  Bạn nhập Port bạn mới khai báo mở lúc nãy vào";
echo "";
echo "           Sau khi thêm, sửa xong. Bạn nhấn ESC, tiếp theo nhấn :wq để thoát";
echo "==============================================================================";
pause '                      Nhấn [Enter] để tiếp tục...';
echo "==============================================================================";
echo "";
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
