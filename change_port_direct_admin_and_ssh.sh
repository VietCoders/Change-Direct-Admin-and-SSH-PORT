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
echo "==============================================================================";
echo "           CHÀO MỪNG BẠN, CHÚNG TA BẮT ĐẦU THAY ĐỔI PORT SSH VPS ^^ ";
echo "";
echo "                 Để hoạt động tốt nhất, chúng ta cần tắt SElinux";
echo "";
echo " ";
echo "                        Ở TRONG FILE MỞ SAU KHI ENTER";
echo " Tìm đến dòng SELINUX=enforcing chọn phím i để vào trạng thái chỉnh sửa tệp tin";
echo "";
echo "                        Bạn chỉnh thành SELINUX=disabled";
echo "";
echo "           Sau khi thêm, sửa xong. Bạn nhấn ESC, tiếp theo nhấn :wq để thoát";
echo "==============================================================================";
pause '                      Nhấn [Enter] để KHỞI ĐỘNG LẠI...';
echo "==============================================================================";
echo "";
vi /etc/sysconfig/selinux;
sestatus;
yum update -y;
echo "==============================================================================";
echo "                       Cấu hình SSH đổi port mong muốn ";
echo "";
echo "  Mặc định là port 22 nên Port đã ẩn bằng #Port 22. Bạn sửa thành port mong muốn:";
echo "";
echo "        Ví dụ: #Port 22 thành      Port=12523 | Tương ứng Port SSH là 12533";
echo "                      Bạn nhớ xoá dấu # trước Port nhé";
echo "";
echo "Một điều QUAN TRỌNG là cần thay đổi PORT không được trùng với các PORT khác đang hoạt động";
echo "";
echo "           Sau khi thêm, sửa xong. Bạn nhấn ESC, tiếp theo nhấn :wq để thoát";
echo "==============================================================================";
pause '                      Nhấn [Enter] để tiếp tục...';
echo "==============================================================================";
echo "";
vi /etc/ssh/sshd_config;
systemctl restart sshd.service;
yum install net-tools -y;
netstat -tupln;
echo "==============================================================================";
echo "              Chúc mừng bạn đã Khai báo / Mở Port SSH VPS thành công ^^ ";
echo "         Tuy nhiên bạn cần mở chặn trong Firewall của Direct Admin nữa";
echo "";
echo "   Bạn kéo xuống dưới cùng phần PORT_sshd = "" Bạn thêm PORT SSH vào tương ứng";
echo "";
echo "           Sau khi thêm, sửa xong. Bạn nhấn ESC, tiếp theo nhấn :wq để thoát";
echo "==============================================================================";
pause '                      Nhấn [Enter] để tiếp tục...';
echo "==============================================================================";
echo "";
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
find . -name "change_port_direct_admin_and_ssh.sh" -delete;
find . -name "csf_install.sh" -delete;
history -c;
reboot
