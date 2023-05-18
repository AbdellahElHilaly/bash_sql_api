#!/bin/bash

mysqlHost="localhost"
user="root"
password=""
database="FIFA"

# SQL query
#default
query1="SELECT * FROM admin;"
#order by username
query2="SELECT * FROM admin order by username;"
#calcute how many "l" in the username
query3="SELECT username, LENGTH(username) - LENGTH(REPLACE(username, 'l', '')) AS count FROM admin;"

# Execute the query and capture the result
result1=$(mysql -h "$mysqlHost" -u "$user" -p"$password" "$database" -e "$query1")
result2=$(mysql -h "$mysqlHost" -u "$user" -p"$password" "$database" -e "$query2")
result3=$(mysql -h "$mysqlHost" -u "$user" -p"$password" "$database" -e "$query3")

# File path
file="data.csv"

# Write the result to the file
echo "---------------------------------------data default---------------------------------------" > "$file"
echo "$result1" >> "$file"

echo "---------------------------------------data order by username-----------------------------" >> "$file"
echo "$result2" >> "$file"

echo "---------------------------------------data count l--------------------------------------" >> "$file"
echo "$result3" >> "$file"


echo "Data written to $file successfully."



uninstall gcc from ubuntu : sudo apt-get remove gcc