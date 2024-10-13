#!/bin/bash

$SNAP/usr/local/bin/mimir server -config.file $SNAP_DATA/mimir.yml --homepath $SNAP/usr/share/grafana --pidfile $SNAP_DATA/grafana.pid
