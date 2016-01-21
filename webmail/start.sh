#!/bin/bash
/etc/init.d/courier-authdaemon start
/etc/init.d/sqwebmail start
apache2 -DFOREGROUND
