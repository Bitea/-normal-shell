#bin/bash
echo "开始进行解锁"
wget -O /root/refresh-dns.sh https://git.io/JR7RH && bash /root/refresh-dns.sh
echo "开始添加定时任务"
crontab -l 2>/dev/null > /root/crontab_test 
echo '*/5 * * * * bash /root/refresh-dns.sh' >> /root/crontab_test 
crontab /root/crontab_test 
crontask=$(crontab -l)

echo -------------------------------------------------------
echo -e "设置定时任务成功，当前系统所有定时任务清单如下:\n${crontask}"
echo -------------------------------------------------------

exit
