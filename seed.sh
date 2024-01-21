# docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='CREATE TABLE Persons (id int NOT NULL AUTO_INCREMENT, FirstName varchar(255), PRIMARY KEY (id));' my_database

docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='INSERT INTO Persons (FirstName) VALUES ("arsalan0");' my_database
docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='INSERT INTO Persons (FirstName) VALUES ("arsalan1");' my_database
docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='INSERT INTO Persons (FirstName) VALUES ("arsalan2");' my_database
docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='INSERT INTO Persons (FirstName) VALUES ("arsalan3");' my_database
docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='INSERT INTO Persons (FirstName) VALUES ("arsalan4");' my_database
docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='INSERT INTO Persons (FirstName) VALUES ("arsalan5");' my_database
docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='INSERT INTO Persons (FirstName) VALUES ("arsalan6");' my_database
docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='INSERT INTO Persons (FirstName) VALUES ("arsalan7");' my_database
docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='INSERT INTO Persons (FirstName) VALUES ("arsalan8");' my_database
docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='INSERT INTO Persons (FirstName) VALUES ("arsalan9");' my_database

docker compose exec -i mysql mysql -uroot -p'my_root_password' --execute='SELECT * FROM Persons;' my_database

# docker compose exec -it mysql mysql -uroot -p'my_root_password' my_database
