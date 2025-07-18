#!/bin/bash
response=$(curl -s https://api.github.com/meta)

ipv4_array=$(echo "$response" | jq '.actions | tostring')
ipv6_array="\"[]\""  # string JSON gol pentru ipv6

cat <<EOF
{
  "ipv4": $ipv4_array,
  "ipv6": $ipv6_array
}
EOF
