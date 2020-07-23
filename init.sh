#!/bin/bash
set -e

#TODO: automatically download http://mirrors.163.com/archlinux/iso/latest/

uu=$SUDO_USER

export XDG_RUNTIME_DIR=/run/user/$SUDO_UID
export USER=$uu
export LONGNAME=$uu
export HOME=/home/$uu
mount --make-private --bind root.x86_64/ root.x86_64/
cleanup()
{
    umount -l ./root.x86_64/
    exit
}

trap cleanup EXIT

./arch-chroot -u $SUDO_USER:$SUDO_USER root.x86_64
