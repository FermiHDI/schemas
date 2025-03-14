#!/bin/bash

echo "Deploying JSON Schemas to Object Store"

for file in ./*.json; do
  if [ -f "$file" ]; then
    echo "Deploying ./${file}..."
    s3cmd del s3://fermihdi-schemas/${file}
    s3cmd put ./${file} s3://fermihdi-schemas/${file}
    s3cmd setacl s3://fermihdi-schemas/${file} --acl-public
done

for file in ./hd/*.json; do
  if [ -f "$file" ]; then
    echo "Deploying ./hd/${file}..."
    s3cmd del s3://fermihdi-schemas/hd/${file}
    s3cmd put ./${file} s3://fermihdi-schemas/hd/${file}
    s3cmd setacl s3://fermihdi-schemas/hd/${file} --acl-public
done

for file in ./hd/openapi/*.json; do
  if [ -f "$file" ]; then
    echo "Deploying ./hd/openapi/${file}..."
    s3cmd del s3://fermihdi-schemas/hd/openapi/${file}
    s3cmd put ./${file} s3://fermihdi-schemas/hd/openapi/${file}
    s3cmd setacl s3://fermihdi-schemas/hd/openapi/${file} --acl-public
done

for file in ./openapi/*.json; do
  if [ -f "$file" ]; then
    echo "Deploying ./openapi/${file}..."
    s3cmd del s3://fermihdi-schemas/openapi/${file}
    s3cmd put ./${file} s3://fermihdi-schemas/openapi/${file}
    s3cmd setacl s3://fermihdi-schemas/openapi/${file} --acl-public
done

echo "JSON Schemas deployed successfully!"