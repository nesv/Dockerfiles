#!/usr/bin/env bash
#
# Helper script for running Elasticsearch.
#
NAME=elasticsearch

ES_HEAP_SIZE=256m
ES_HOME=/usr/share/$NAME
PID_FILE=/var/run/$NAME.pid
LOG_DIR=/var/log/$NAME
DATA_DIR=/var/lib/$NAME
WORK_DIR=/tmp/$NAME
CONF_DIR=/etc/$NAME
CONF_FILE=$CONF_DIR/elasticsearch.yml
DAEMON=$ES_HOME/bin/elasticsearch
DAEMON_OPTS="-p $PID_FILE -Des.default.config=$CONF_FILE -Des.default.path.home=$ES_HOME -Des.default.path.logs=$LOG_DIR -Des.default.path.data=$DATA_DIR -Des.default.path.work=$WORK_DIR -Des.default.path.conf=$CONF_DIR"

# Prepare the environment.
mkdir -p "$LOG_DIR" "$DATA_DIR" "$WORK_DIR"
touch "$PID_FILE"

# Run it!
exec $DAEMON $DAEMON_OPTS
