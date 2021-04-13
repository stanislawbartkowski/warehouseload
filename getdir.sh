source env.rc

DIR=
curl -X GET  https://$URL/dbapi/v4/home/$DIR   -H "authorization: Bearer $TOKEN"   -H 'content-type: application/json' -k