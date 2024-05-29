#!/bin/bash

favicon_path="./public/assets/favicon/favicon.ico"
export MASTER_URL="$favicon_path"

cd ./deploy/tools/favicon-generator
./script.sh

if [ $? -ne 0 ]; then
    cd ../../../
    exit 1
else
    cd ../../../
    favicon_folder="./public/assets/favicon/"

    echo "⏳ Remplacement des favicons par le pack fraîchement généré..."
    if [ -d "$favicon_folder" ]; then
        rm -r "$favicon_folder"
    fi
    mkdir -p "$favicon_folder"
    cp -r ./deploy/tools/favicon-generator/output/* "$favicon_folder"
fi