# show external ip and geolocation
function whereami {
  curl -sb -H "Connection: close" http://freegeoip.net/csv/ | tr -d \"  | awk 'BEGIN{FS=","} {printf "%-6s: %s\n%-6s: %s %s, %s (%s %s)\n%-6s: %s, %s\n", "ip", $1, "city", $7, $6, $5, $3, $2, "coords", $8, $9}'
}
