#!/usr/bin/env bash

. settings.sh

virsh \
    --connect $VIRSH_URL \
    destroy $INSTANCE_NAME

virsh \
    --connect $VIRSH_URL \
    undefine $INSTANCE_NAME

rm -f $BACKING_FILE
