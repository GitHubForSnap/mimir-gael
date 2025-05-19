#!/bin/bash

$SNAP/usr/local/bin/mimir server -config.file $SNAP_DATA/mimir.yaml --homepath $SNAP/usr/share/grafana --pidfile $SNAP_DATA/mimir.pid
