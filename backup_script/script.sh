#!/bin/sh

CONTAINER_ID=mysql

# set up the date variable
NOW=$(date +%Y%m%d%H%M%S)
BINLOG_BACKUP=${NOW}_binlog.tar.gz

# set up the database credentials
DB_USER=root
DB_PASSWORD=my_root_password
DB_PORT=33306

# binary log files directory path
BINLOGS_PATH=/bitnami/mysql/data/

# flush the current log and start writing to a new binary log file
mysql -h 127.0.0.1 -P $DB_PORT -u$DB_USER -p$DB_PASSWORD -E --execute='FLUSH BINARY LOGS;' mysql
# docker compose exec -i mysql mysql -u$DB_USER -p$DB_PASSWORD --execute='FLUSH BINARY LOGS;' mysql

# get a list of all binary log files
BINLOGS=$(mysql -h 127.0.0.1 -P $DB_PORT -u$DB_USER -p$DB_PASSWORD -E --execute='SHOW BINARY LOGS;' mysql | grep Log_name | sed -e 's/Log_name://g' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

# get the most recent binary log file
BINLOG_CURRENT=`echo "${BINLOGS}" | tail -n -1`

# get list of binary logs to be backed up (everything except the most recent one)
BINLOGS_FOR_BACKUP=`echo "${BINLOGS}" | head -n -1`

# create a list of the full paths to the binary logs to be backed up
BINLOGS_FULL_PATH=`echo "${BINLOGS_FOR_BACKUP}" | xargs -I % echo $BINLOGS_PATH%`

# copy log files into the host
for LOG_FILE in $BINLOGS_FULL_PATH; do docker cp "$CONTAINER_ID:$LOG_FILE" "./log_files/"; done

# create a list of the full paths to the binary logs to be backed up
BINLOGS_FULL_PATH=`echo "${BINLOGS_FOR_BACKUP}" | xargs -I % echo "./log_files/"%`

# compress the list of binary logs to be backed up into an archive in the backup location
tar -czvf ./backups/$BINLOG_BACKUP $BINLOGS_FULL_PATH

# TODO: delete logs inside log_files directory

# delete the binary logs that have been backed up
echo $BINLOG_CURRENT | xargs -I % mysql -h 127.0.0.1 -P $DB_PORT -u$DB_USER -p$DB_PASSWORD -E --execute='PURGE BINARY LOGS TO "%";' mysql
