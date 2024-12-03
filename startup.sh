#!/bin/bash

service dbus start
service avahi-daemon start
service smbd start
service cups start
cupsctl _debug_logging=1

exec tail -f /var/log/cups/error_log