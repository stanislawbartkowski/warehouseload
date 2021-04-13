source env.rc

SCHEMA=BXQ11031
TABLE=PARQUETTA
SOURCEPA=nrekha-kops-state-store::sbtest/out/export-0
#SOURCEPA=/sbtest/out/export-0

curl -X POST   https://$URL/dbapi/v4/load_jobs  -H "authorization: Bearer $TOKEN"  -H 'content-type: application/json'  \
 -d "{\"load_source\":\"S3\", \
      \"load_action\":\"INSERT\", \
      \"schema\":\"$SCHEMA\",\"table\":\"$TABLE\", \
      \"max_warning_count\":1000, \
      \"auto_create_table\":{\"execute\":\"no\"},  \
      \"cloud_source\":{\"endpoint\":\"$ENDPOINT\",\"path\":\"$SOURCEPA\", \
      \"auth_id\":\"$AWSKEY\",\"auth_secret\":\"$AWSSECRETKEY\"},\
      \"file_options\":{\"has_header_row\":\"no\",\"column_delimiter\":\"|\"}}"
