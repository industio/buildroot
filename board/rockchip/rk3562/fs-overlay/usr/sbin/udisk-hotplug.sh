#!/bin/sh
if [ $# -ne 3 ]; then
    exit 1
fi
ACTION=$1
DEV_NAME=$2
LABEL_NAME=$3

MOUNT_BASE=/mnt/udisk
MOUNT_POINT=$MOUNT_BASE/$LABEL_NAME

if [ "$ACTION" == "add" ]; then
    mkdir -p "$MOUNT_POINT"
    mount -o relatime /dev/$DEV_NAME "$MOUNT_POINT"
elif [ "$ACTION" == "remove" ]; then
    umount "$MOUNT_POINT"
    rmdir "$MOUNT_POINT"
fi
