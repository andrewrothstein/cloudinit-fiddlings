#!/usr/bin/env bash

. settings.sh

virsh \
    --connect qemu:///session \
    destroy $INSTANCE_NAME

virsh \
    --connect qemu:///session \
    undefine $INSTANCE_NAME

rm -f $BACKING_FILE
