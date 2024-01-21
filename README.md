# mysql-incremental-backup
mysql-incremental-backup

## Restore From Binary Logs
```sh
mysqlbinlog --no-defaults -dmy_database ./backup_script/log_files/binlog.* | mysql -h 127.0.0.1 -P33307 -uroot -p'my_root_password' my_database

for log in ./backup_script/log_files/binlog.*; do mysqlbinlog --no-defaults -dmy_database $log | mysql -h 127.0.0.1 -P33307 -uroot -p my_database; done

docker compose exec -it mysql mysql -uroot -p'my_root_password' my_database
```
