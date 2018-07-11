#!/bin/bash

#Replace spark Master in the doc
sed -i "s|_SPARK_MASTER_|${SPARK_MASTER}|g" /usr/livy/conf/livy.conf


#Start server
/usr/livy/bin/livy-server start

#show logs
tail -f /usr/livy/logs/livy--server.out