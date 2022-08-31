#!/bin/bash
CODE=0

# while ($CODE -ne 200); do
#         CODE=$(curl --write-out "%{http_code}\n" -s -XGET "localhost:9200/filebeat*/_settings?pretty" --output /dev/null )
#         sleep 10
# done

# CODE=0
# sleep 50
# while ($CODE -ne 200);do
#     CODE=$(curl --write-out "%{http_code}\n" -s -XGET "localhost" --output /dev/null )
#     sleep 10
# done



curl 192.168.50.4 --output /dev/null


curl --write-out "%{http_code}\n" -s -XGET "localhost:9200/filebeat*/_settings?pretty" --output /dev/null

for i in $(curl -s -XGET "localhost:9200/filebeat*/_settings?pretty" | grep provided | cut -d '"' -f4); do

IFS= read -r -d ''  VAR <<EOF
'
{
	"attributes": {
		"fieldAttrs":"{}",
		"title":"${i}",
		"timeFieldName":"@timestamp",
		"fields":"[]",
		"typeMeta":"{}",
		"runtimeFieldMap":"{}"
	}
}
'
EOF

curl 'http://localhost/api/saved_objects/index-pattern' -X POST \
-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101 Firefox/103.0' \
-H 'Accept: */*' \
-H 'Accept-Language: es-ES,es;q=0.8,en-US;q=0.5,en;q=0.3' \
-H 'Accept-Encoding: gzip, deflate, br' \
-H 'Referer: http://localhost:8080/app/management/kibana/indexPatterns' \
-H 'Content-Type: application/json' \
-H 'kbn-version: 7.17.6' \
-H 'Origin: http://localhost:8080' \
-H 'DNT: 1' \
-H 'Authorization: Basic a2liYW5hYWRtaW46a2liYW5hYWRtaW4=' \
-H 'Connection: keep-alive' \
-H 'Sec-Fetch-Dest: empty' \
-H 'Sec-Fetch-Mode: cors' \
-H 'Sec-Fetch-Site: same-origin' \
--data-raw '{"attributes":{"fieldAttrs":"{}","title":"'${i}'","timeFieldName":"@timestamp","fields":"[]","typeMeta":"{}","runtimeFieldMap":"{}"}}'

done
