for db in ../../new_data/*.db
do
  sqlite3 $db < minimize.sql
done
