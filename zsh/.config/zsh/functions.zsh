function brew() {
  if [[ $1 == "add" ]]; then
    # Remove the first argument ("add")
    shift
    # Install the package
    command brew install "$@"
    # Update the global Brewfile
    command brew bundle dump --global --force
  else
    # Call the original brew command with all original arguments
    command brew "$@"
  fi
}

jwtd () {
  local input="${1:-}"
  if [ -z "$input" ]; then
    if [ ! -t 0 ]; then
      input=$(cat /dev/stdin)
    else
      echo >&2 '✗ Need an argument or have a piped input!'
      return 1
    fi
  fi

  echo "$input" | awk -F'.' '{print $1"\n"$2}' | while read -r part; do
    echo "$part" | base64 -d 2>/dev/null | jq .
  done
}
