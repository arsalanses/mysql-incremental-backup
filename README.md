# mysql-incremental-backup
mysql-incremental-backup

## Restore From Binary Logs
```sh
docker compose up -d

bash seed.sh

cd backup_script ; bash script.sh

mysqlbinlog --no-defaults -dmy_database ./backup_script/log_files/binlog.* | mysql -h 127.0.0.1 -P33307 -uroot -p'my_root_password' my_database

for log in ./log_files/binlog.*; do echo $log; done
for log in ./log_files/binlog.*; do mysqlbinlog --no-defaults -dmy_database $log | mysql -h 127.0.0.1 -P33307 -uroot -p'my_root_password' my_database; done

docker compose exec -i mysql-recovery mysql -uroot -p'my_root_password' --execute='show tables;' my_database
docker compose exec -i mysql-recovery mysql -uroot -p'my_root_password' --execute='select * from Persons;' my_database
```

- [types of backup](https://spanning.com/blog/types-of-backup-understanding-full-differential-incremental-backup/)
- [incremental backups](https://spinupwp.com/incremental-mysql-backups/)
