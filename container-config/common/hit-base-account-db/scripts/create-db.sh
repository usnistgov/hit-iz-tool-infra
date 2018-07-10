#!/bin/sh

# parameters
MYSQL_ROOT_PWD=${MYSQL_ROOT_PWD:-"hitBase!@#T"}
TOOL_USER=${TOOL_USER:-"hitBaseUser"}
TOOL_USER_PWD=${TOOL_USER_PWD:-"hitBase123!"}
TOOL_DB=${TOOL_DB:-"hit-base-account-db"}


if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d /var/lib/mysql/mysql ]; then
	echo '[i] MySQL directory already present, skipping creation'
else
	echo "[i] MySQL data directory not found, creating initial DBs"

	chown -R mysql:mysql /var/lib/mysql

	# init database
	echo 'Initializing database'
	mysql_install_db --user=mysql > /dev/null
	echo 'Database initialized'

	echo "[i] MySql root password: $MYSQL_ROOT_PWD"

	# create temp file
	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
	    return 1
	fi

	# save sql
	echo "[i] Create temp file: $tfile"
	cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PWD' WITH GRANT OPTION;

EOF


    # create erx tool account DB
    echo "[i] Creating database: $TOOL_DB"
    echo "CREATE DATABASE \`$TOOL_DB\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tfile

    # create erx tool user username and password
    echo "[i] Creating user: $TOOL_USER with password $TOOL_USER_PWD"
    echo "GRANT ALL ON \`$TOOL_DB\`.* to '$TOOL_USER'@'%' IDENTIFIED BY '$TOOL_USER_PWD';" >> $tfile
    echo 'FLUSH PRIVILEGES;' >> $tfile

    # run sql in tempfile
    echo "[i] run tempfile: $tfile"
    /usr/bin/mysqld --user=mysql --bootstrap --verbose=0 < $tfile
    rm -f $tfile
fi

echo "[i] Sleeping 5 sec"
sleep 5

echo '[i] start running mysqld'
exec /usr/bin/mysqld --user=mysql --console

echo '[i] loading account data'
mysql -u $TOOL_USER -p$TOOL_USER_PWD $TOOL_DB < create-account-tables.sql

