if [ -f install.txt ]; then
    # If install.txt exists locally, read and process it
    while IFS= read -r item
    do
       echo "$item"
    done < install.txt
else
    # If install.txt is not found, fetch from GitHub raw URL and process it without downloading
    curl -s https://raw.githubusercontent.com/xaaha/dev-env/main/install.txt | while IFS= read -r item
    do
       echo "$item"
    done
fi

