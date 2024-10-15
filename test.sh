curl -O https://raw.githubusercontent.com/xaaha/dev-env/refs/heads/main/install.txt

if [ -f install.txt ]; then
    while IFS= read -r item
    do
       echo "$item" 
    done < install.txt
else
    echo "install.txt not found."
fi

