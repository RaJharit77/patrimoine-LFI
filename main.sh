#!/bin/bash

# Detect windows
is_windows() {
    [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" || "$OSTYPE" == "cygwin" ]]
}

# Config
PATRIMOINE_BASE_DIR="$HOME/.patrimoine"
REALISES_DIR="$PATRIMOINE_BASE_DIR/download/realises"

if [ ! -d "$REALISES_DIR" ] || [ -z "$(ls -A "$REALISES_DIR" 2>/dev/null)" ]; then
    echo "ERROR: Patrimoine not initialized"
    echo ""
    echo "Please run init.sh first"
    echo ""
    exit 1
fi

LAST_VERSION="0.2.9" # put here the latest version number
LINK='https://www.dropbox.com/scl/fi/vq9tb9q4n7rxe1y1hlo3h/patrimoine-0.2.9.jar?rlkey=iepbhyq7muz2qnz4ipq5crsox&st=pf8koyk7&dl=1'
JAR_NAME="patrimoine@${LAST_VERSION}.jar"
USER_DIR="$HOME"

cd "$USER_DIR" || { echo "Impossible d'accéder au dossier $USER_DIR"; exit 1; }

echo "Vérification de la présence du fichier patrimoine.jar dans $USER_DIR..."

# Find existing jar files matching the pattern
EXISTING_JAR=$(ls patrimoine@*.jar 2>/dev/null | head -n 1)

if [ -n "$EXISTING_JAR" ]; then
    CURRENT_VERSION=$(echo "$EXISTING_JAR" | cut -d "@" -f 2 | cut -d "." -f 1-3)
    if [ "$CURRENT_VERSION" = "$LAST_VERSION" ]; then
        echo "Vous avez déjà la dernière version : $EXISTING_JAR dans $(pwd)/$EXISTING_JAR"
    else
        echo "Ancienne version détectée : $CURRENT_VERSION. Suppression et téléchargement de la version $LAST_VERSION..."
        rm -f "$EXISTING_JAR"
        if is_windows; then
            curl --ssl-no-revoke -L -o "$JAR_NAME" "$LINK"
        else
            curl -L -o "$JAR_NAME" "$LINK"
        fi
    fi
else
    echo "Aucune version détectée. Téléchargement de la version $LAST_VERSION..."
    echo "Le téléchargement peut prendre quelques instants..."
    if is_windows; then
        curl --ssl-no-revoke -L -o "$JAR_NAME" "$LINK"
    else
        curl -L -o "$JAR_NAME" "$LINK"
    fi
fi

echo "Lancement de $JAR_NAME..."
java -Dpatrimoine.mode=OFFLINE -jar "$JAR_NAME"
