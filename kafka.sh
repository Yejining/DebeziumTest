#!/bin/bash

# 커넥트 실행
connect-standalone -daemon /etc/kafka/connect-standalone.properties

# 커넥트 실행 확인
curl -X GET http://localhost:8083

# 설치된 플러그인 확인
curl -X GET http://localhost:8083/connector-plugins | python -m json.tool

# 커넥터 추가
curl -X POST 'http://localhost:8083/connectors' \
--header 'Content-type: application/json' \
--data-raw '{
  "name": "debezium-mysql-source-connector",
  "config": {
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "tasks.max": "1",
    "database.hostname": "mysql",
    "database.port": "3306",
    "database.user": "pseudo",
    "database.password": "pseudo",
    "database.server.id": "18405",
    "topic.prefix": "debezium-mysql-source",
    "database.include.list": "pseudo",
    "schema.history.internal.kafka.topic": "debezium-mysql-source-history",
    "schema.history.internal.kafka.bootstrap.servers": "kafka-1:9092",
    "include.schema.changes": "true"
  }
}'

# 소스 커넥터 확인
curl -X GET http://localhost:8083/connectors
