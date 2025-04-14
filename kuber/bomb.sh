#!/bin/bash

URL="http://$1/log"

for i in {1..1000}; do
  curl -s -X POST "$URL" \
    -H "Content-Type: application/json" \
    -d "{\"message\": \"number $i\"}"
done
