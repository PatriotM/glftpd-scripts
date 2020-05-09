# Create backup.
if [ ! -e /mnt/speed_backup.sh ] ; then
echo -n "Creating backup (/mnt/speed_backup.sh)...  "
echo "#!/bin/bash" > /mnt/speed_backup.sh
echo "" >> /mnt/speed_backup.sh
echo "echo \"`cat /proc/sys/net/ipv4/tcp_sack`\" > /proc/sys/net/ipv4/tcp_sack" >> /mnt/speed_backup.sh
echo "echo \"`cat /proc/sys/net/ipv4/tcp_timestamps`\" > /proc/sys/net/ipv4/tcp_timestamps" >> /mnt/speed_backup.sh
echo "echo \"`cat /proc/sys/net/ipv4/tcp_mem`\" > /proc/sys/net/ipv4/tcp_mem" >> /mnt/speed_backup.sh
echo "echo \"`cat /proc/sys/net/ipv4/tcp_rmem`\" > /proc/sys/net/ipv4/tcp_rmem" >> /mnt/speed_backup.sh
echo "echo \"`cat /proc/sys/net/ipv4/tcp_wmem`\" > /proc/sys/net/ipv4/tcp_wmem" >> /mnt/speed_backup.sh
echo "echo \"`cat /proc/sys/net/core/optmem_max`\" > /proc/sys/net/core/optmem_max" >> /mnt/speed_backup.sh
echo "echo \"`cat /proc/sys/net/core/rmem_default`\" > /proc/sys/net/core/rmem_default" >> /mnt/speed_backup.sh
echo "echo \"`cat /proc/sys/net/core/rmem_max`\" > /proc/sys/net/core/rmem_max" >> /mnt/speed_backup.sh
echo "echo \"`cat /proc/sys/net/core/wmem_default`\" > /proc/sys/net/core/wmem_default" >> /mnt/speed_backup.sh
echo "echo \"`cat /proc/sys/net/core/wmem_max`\" > /proc/sys/net/core/wmem_max" >> /mnt/speed_backup.sh
chmod 744 /mnt/speed_backup.sh
echo -e "\tdone!"
else
echo "Backup found (`pwd`/speed_backup.sh). Skipping creation of one."
fi

# Boost buffer settings
echo -n "Boosting...  "
echo "1048576" > /proc/sys/net/core/optmem_max
echo "20971520" > /proc/sys/net/core/wmem_max
echo "20971520" > /proc/sys/net/core/rmem_max
echo "8192 2621440 10485760" > /proc/sys/net/ipv4/tcp_wmem
echo "8192 2621440 10485760" > /proc/sys/net/ipv4/tcp_rmem
echo "1" > /proc/sys/net/ipv4/tcp_timestamps
echo "1" > /proc/sys/net/ipv4/tcp_sack
echo "1" > /proc/sys/net/ipv4/tcp_window_scaling
echo "3129344 3137536 3145728" > /proc/sys/net/ipv4/tcp_mem
echo -e "\tdone!"

