function jwtd () {
  local input="${1:-}"
  if [ -z "$input" ]; then
    if [ ! -t 0 ]; then
      input=$(cat /dev/stdin)
    else
      echo >&2 '✗ Need an argument or have a piped input!'
      return 1
    fi
  fi

  # Split JWT into parts and decode each part
  echo "$input" | awk -F'.' '{print $1"\n"$2}' | while read -r part; do
    decoded=$(echo "$part" | tr '_-' '/+' | base64 -d 2>/dev/null)
    if [ $? -eq 0 ]; then
      # Validate and format as JSON using jq
      echo "$decoded" | jq . 2>/dev/null
      if [ $? -ne 0 ]; then
        echo "✗ Decoded part is not valid JSON: \n $decoded" >&2
      fi
    else
      echo "✗ Failed to decode Base64 part: $part" >&2
    fi
  done
}
