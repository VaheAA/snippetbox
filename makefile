.PHONY: mysql createdb dropdb server startContainer

mysql: 
	docker run --name snippetbox -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql

startContainer:
	docker start snippetbox

createdb: 
	docker exec -i snippetbox mysql -uroot -proot --protocol=tcp -e "CREATE DATABASE IF NOT EXISTS snippetbox;"

dropdb: 
	docker exec -i snippetbox mysql -uroot -proot --protocol=tcp -e "DROP DATABASE IF EXISTS snippetbox;"

server: 
	go run ./cmd/web