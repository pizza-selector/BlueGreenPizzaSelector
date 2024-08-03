to run local database

can be easilly expanded to have multiple DBs under the same container

docker build -t local-sql-db .
docker run -p 1433:1433 --name local-sql-db local-sql-db

then export connection string as env varable:

$env:SQL_CONNECTION_STRING = 'jdbc:sqlserver://localhost:1433;databaseName=pizza_db;user=pizza_sql_user;password=SaPassword1;'