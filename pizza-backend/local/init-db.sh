#!/usr/bin/env bash
"$@" &
pid="$!"

# List of all databases to create
declare -a db_names=(
  "pizza_db"
)

echo "MSSQL DB: Wait until SQL Server is ready for client connections..."
while [ ! -f /var/opt/mssql/log/errorlog ]; do
  sleep 2
done

echo "MSSQL DB: Waiting for recovery..."
tail -f /var/opt/mssql/log/errorlog | while read LOGLINE; do
  [[ "${LOGLINE}" == *"Recovery is complete."* ]] && pkill -P $$ tail
done
# Give process some time to finish
sleep 5

echo "MSSQL DB: Recovery complete, start creating login..."
/opt/mssql-tools/bin/sqlcmd -S localhost -d master -U sa -P SaPassword1 -Q "CREATE LOGIN pizza_sql_user WITH password='SaPassword1'"

echo "MSSQL DB: Creating databases and setting permissions..."
for db_name in "${db_names[@]}"
do
  echo "Creating database $db_name..."
  /opt/mssql-tools/bin/sqlcmd -S localhost -d master -U sa -P SaPassword1 -Q "CREATE DATABASE $db_name"
  /opt/mssql-tools/bin/sqlcmd -S localhost -d $db_name -U sa -P SaPassword1 -Q "CREATE USER pizza_sql_user FOR LOGIN pizza_sql_user WITH DEFAULT_SCHEMA=dbo; ALTER ROLE [db_owner] ADD MEMBER pizza_sql_user;"
done

echo "MSSQL DB: Startup complete."

# Wait for exit
wait "$pid"