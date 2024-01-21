# mysql-incremental-backup
mysql-incremental-backup

## Restore From Binary Logs
```sh
mysqlbinlog --no-defaults -dmy_database ./backup_script/backups/log.mysql-bin | mysql -uroot -p my_database

for log in ./backup_script/backups/log.*; do mysqlbinlog --no-defaults -dmy_database $log | mysql -uroot -p my_database; done
```
