#!/bin/bash

#Variables
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' 
url=URL

check_status() {
  local url=$1
  local method=$2
  local payload=$3

  local response=$(curl -s -X $method \
    -H "Content-Type: application/json" \
    -w "%{http_code}" \
    -o /dev/null \
    -d "$payload" \
    $url
  )

  if [ "$response" -eq 200 ]; then
    echo "${GREEN}Status Success: $response${NC}"
  else
    echo "${RED}Status Failed: $response${NC}"
    exit 1  
  fi
}


check_status "$url/items" "PUT" '{"id":"3","price": "2002", "name": "devops2"}'