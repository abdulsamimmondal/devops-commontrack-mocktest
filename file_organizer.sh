#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <directory-path>"
  exit 1
fi

TARGET_DIR="$1"

if [ ! -d "$TARGET_DIR" ]; then
  echo "Directory '$TARGET_DIR' does not exist."
  exit 1
fi

read -p "Enter file extension to organize (e.g., txt, sh, log): " EXT

DEST_DIR="$TARGET_DIR/organized/$EXT"
mkdir -p "$DEST_DIR"

COUNT=0
for FILE in "$TARGET_DIR"/*."$EXT"; do
 
  if [ -e "$FILE" ]; then
    BASENAME=$(basename "$FILE")
    mv "$FILE" "$DEST_DIR/"
    echo "Moved: $FILE → $DEST_DIR/$BASENAME"
    ((COUNT++))
  fi
done

echo "Total files moved: $COUNT"
