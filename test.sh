# Read the install.txt file and install each item
if [ -f install.txt ]; then
    while IFS= read -r item
    do
       echo "$item" 
    done < install.txt
else
    echo "install.txt not found."
fi

