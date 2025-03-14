#!/bin/bash

echo "Deploying JSON Schemas to Object Store"

function deploy {
  local directory=$1
  for file in "${1}"*.json; do
    if [ -f "$file" ]; then
      file2=${file#"./"}
      echo "Deploying ./${file2}..."
      s3cmd del s3://fermihdi-schemas/${file2}
      s3cmd put ./${file2} s3://fermihdi-schemas/${file2}
      s3cmd setacl s3://fermihdi-schemas/${file2} --acl-public
    fi
  done
}

deploy "./"
deploy "./hd/"
deploy "./hd/openapi/"
deploy "./openapi/"

echo "JSON Schemas deployed successfully!"