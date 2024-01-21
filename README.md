# mysql-incremental-backup
mysql-incremental-backup

## Restore From Binary Logs
```sh
mysqlbinlog --no-defaults -dmy_database ./backup_script/backups/20240121180057_binlog/log_files/ | mysql -h 127.0.0.1 -P33307 -uroot -p'my_root_password' my_database

for log in ./backup_script/backups/log.*; do mysqlbinlog --no-defaults -dmy_database $log | mysql -h 127.0.0.1 -P33307 -uroot -p my_database; done

docker compose exec -it mysql mysql -uroot -p'my_root_password' my_database
```
