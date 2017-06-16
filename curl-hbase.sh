function encode {
  echo $1 | tr -d "\n" | base64
}


#commands that create an HBase table, using HBase REST server (needs to be enabled/installed if not there)
#first create a table called 'test' with a CF called 'data'
curl -v -X PUT 'http://localhost:20550/test/schema' -H "Accept: application/json" -H "Content-Type: application/json" -d '{"@name":"test","ColumnSchema":[{"name":"data"}]}'

TABLE='test'
FAMILY='data'
KEY=$(encode 'row1')
COLUMN=$(encode 'data:test')
DATA=$(encode 'Some data...')

curl -v -X PUT \
  'http://localhost:20550/test/row1/data:test' \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d "{\"Row\":{\"@key\":\"$KEY\",\"Cell\":{\"@column\":\"$COLUMN\", \"$\":\"$DATA\"}}}"