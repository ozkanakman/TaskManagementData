#!/bin/bash

SCHEMA_DIR=/data/db-data/schema
DATA_DIR=/data/db-data/table-data

for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -S lbmssql -U sa -P "NotGonnaG8Us" -d master -Q "select * from sys.tables"
    if [ $? -eq 0 ]
    then
        echo "startup completed"
        break
    else
        echo "not ready yet..."
        sleep 1
    fi
done

for entry in "$SCHEMA_DIR"/*
do
  echo "running schema for"
  echo "$entry"
  /opt/mssql-tools/bin/sqlcmd -S lbmssql -U sa -P "NotGonnaG8Us" -i"$entry"
done
cd $DATA_DIR
for database in *
do
  echo "adding data to tables in database $database"
  cd "$database" || exit 1
  for dataentry in *.csv
  do
    echo "adding data for table ${dataentry%.*}"
    /opt/mssql-tools/bin/bcp "${dataentry%.*}" in "$dataentry" -S lbmssql -U sa -P "NotGonnaG8Us" -d "$database" -c -t "|^^|" -r "|^^|\r\n" -E
  done
  cd ..
done
