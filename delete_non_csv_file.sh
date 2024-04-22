#!/bin/bash

# Directory containing the files
SOURCE_DIR="./fin_data"

# Check if the directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Directory does not exist: $SOURCE_DIR"
    exit 1
fi

# Loop through all files in the source directory
echo "Scanning for non-CSV files in $SOURCE_DIR..."
for file in "$SOURCE_DIR"/*; do
    # Check if the file does not end with .csv
    if [[ ! "$file" =~ \.csv$ ]]; then
        # Check if the file variable points to an actual file
        if [ -f "$file" ]; then
            echo "Deleting non-CSV file: $file"
            rm "$file"
        fi
    fi
done

echo "Cleanup complete."
