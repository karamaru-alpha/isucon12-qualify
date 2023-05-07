for db in ../../initial_data/*.db
do
  sqlite3 $db < tenant-index.sql
done
