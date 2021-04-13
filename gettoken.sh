source env.rc

#curl -X POST https://$URL/dbapi/v4/auth/tokens -H 'content-type: application/json' -d "{\"userid\":\"${USER}\",\"password\":\"$PASSWORD\"}" -k 
curl -X POST http://$URL/dbapi/v4/auth/tokens -H 'content-type: application/json' -d "{\"userid\":\"${USER}\",\"password\":\"$PASSWORD\"}" -k 