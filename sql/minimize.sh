cp -r ../../initial_data/*.db ../../new_data/
for db in ../../new_data/*.db
do
  sqlite3 $db < minimize.sql
done
