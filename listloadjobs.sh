source env.rc

curl -X GET   https://$URL/dbapi/v4/load_jobs   -H "authorization: Bearer $TOKEN"   -H 'content-type: application/json' -k -v