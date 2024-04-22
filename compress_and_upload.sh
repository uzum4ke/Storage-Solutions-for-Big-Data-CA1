#!/bin/bash

SOURCE_DIR="$HOME/Desktop/Storage-Solutions-for-Big-Data-CA1/fin_data/"
HDFS_DEST="/financial_data"

# Check and create HDFS directory
echo "Checking if HDFS directory $HDFS_DEST exists..."
hdfs dfs -test -d "$HDFS_DEST"
if [ $? -ne 0 ]; then
    echo "Directory does not exist. Creating $HDFS_DEST..."
    hdfs dfs -mkdir "$HDFS_DEST"
else
    echo "Directory already exists."
fi

echo "Starting compression and upload of CSV files using parallel execution..."
# Compress and upload files in parallel
find "$SOURCE_DIR" -name "*.csv" | parallel --bar "echo 'Processing {}'; gzip -c {} > {}.gz; echo 'Compressed {} -> {}.gz'; hdfs dfs -put {}.gz $HDFS_DEST; echo 'Uploaded {}.gz to $HDFS_DEST'; rm {}.gz; echo 'Deleted local {}.gz'"

echo "All files have been compressed and uploaded successfully."

