#!/bin/bash



echo "--> APT UPDATE"
apt-get update > /dev/null

echo "--> INSTALLATION RCLONE"
apt-get install -y rclone


REMOTE_NAME="my_remote"
REMOTE_DIRECTORY="INSA/vdi/home"

USERNAME=$(users)
HOME_DIRECTORY=/home/$USERNAME

su $USERNAME -


RCLONE_PARAMS='-L --exclude "snap**" --exclude ".ppd**" --include ".config**" --skip-links' 
rclone copy $REMOTE_NAME:$REMOTE_DIRECTORY $HOME_DIRECTORY $RCLONE_PARAMS


exit

echo \* \* \* \* \* $USERNAME /bin/rclone sync $HOME_DIRECOTRY $REMOTE_NAME:$REMOTE_DIRECTORY  $RCLONE_PARAMS >> /etc/crontab

echo "FINI"
