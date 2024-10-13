#!/bin/bash

$SNAP/usr/local/bin/mimir cli -config.file $SNAP_DATA/mimir.yml --homepath $SNAP/usr/share/grafana
