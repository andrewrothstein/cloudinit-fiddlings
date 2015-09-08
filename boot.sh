#!/usr/bin/env bash

. settings.sh

mkdir -p $CLOUDINIT_ISO_DIR
cd $CLOUDINIT_ISO_SRC_DIR
genisoimage \
    -output $CLOUDINIT_ISO \
    -volid cidata \
    -joliet \
    -rock user-data meta-data

qemu-img create -b $RAW -f qcow2 -o size=1024G $BACKING_FILE
virt-install \
    --connect $VIRSH_URL \
    --name $INSTANCE_NAME \
    --ram=$RAM \
    --disk path=$BACKING_FILE \
    --disk path=$CLOUDINIT_ISO,device=cdrom \
    --import \
    --graphics none \
    --noautoconsole
