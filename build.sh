#!/usr/bin/env bash
genisoimage -output /tmp/seed.iso -volid cidata -joliet -rock user-data meta-data
