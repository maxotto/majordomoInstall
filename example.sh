ECHO=/bin/echo
n="-n"
$ECHO $n "CREATE DATABASE db_terminal CHARACTER SET utf8 COLLATE utf8_general_ci;" >> sql.sql
mysql --user=root --password=51983560 < sql.sql -p
rm sql.sql
mysql --user=root --password=51983560 db_terminal < /var/www/html/db_terminal.sql -p
