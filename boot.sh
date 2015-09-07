#!/usr/bin/env bash

. settings.sh

cp $RAW $BACKING_FILE
chmod u+w $BACKING_FILE
virt-install \
    --connect $VIRSH_URL \
    --name $INSTANCE_NAME \
    --ram=$RAM \
    --disk path=$BACKING_FILE \
    --disk path=$CLOUDINIT_ISO,device=cdrom \
    --import \
    --graphics none \
    --noautoconsole
