source env.rc

SCHEMA=PERFDB
INPATH=sbtest/tpcdata/data1/call_center.dat
TABLE=CALL_CENTER

loadintotable() {

    local -r NO=$1

    local -r TMP=`mktemp`
    local -r TABLEDEST=$SCHEMA.$TABLE
    local -r CONNECTION="DATABASE=$DBNAME;HOSTNAME=$DBHOST;PORT=$DBPORT;UID=$USER;PWD=$PASSWORD"


cat << EOF > $TMP

    CALL SYSPROC.ADMIN_CMD('LOAD FROM S3::$ENDPOINT::X$AWSKEY::$AWSSECRETKEY::$BUCKET::$INPATH OF DEL INSERT INTO $TABLEDEST');

    SELECT COUNT(*) FROM $TABLEDEST;

EOF

cat $TMP

#  db2cli execsql -statementdelimiter ";" -connstring "$CONNECTION" -inputsql $ITEMP


db2cli execsql -statementdelimiter ";" -connstring "$CONNECTION" -inputsql $TMP -outfile xxx

echo $?

}

test() {

db2 CONNECT TO BLUDB USER $USER USING $PASSWORD

db2 "DROP TABLE $TABLENAME IF EXISTS"

db2 "CREATE TABLE $TABLENAME LIKE "

db2 "CALL SYSPROC.ADMIN_CMD('LOAD FROM S3::$ENDPOINT::$AWSKEY::$AWSSECRETKEY::$BUCKET::$INPATH OF DEL INSERT INTO $TABLENAME')"

db2 terminate
}

loadintotable $1