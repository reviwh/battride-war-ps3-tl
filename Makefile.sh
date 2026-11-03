#!/bin/bash

mkdir -p build

find -L . -type f -name "*.png" ! -path "*/bak/*" ! -path "./bak/*" | while read -r file; do
    relpath="${file#./}"
    relpath_dds="${relpath%.png}.dds"
    dest_file="build/$relpath_dds"
    dest_dir=$(dirname "$dest_file")
    
    mkdir -p "$dest_dir"
    echo "Converting: $relpath -> $dest_file"
    
    magick "$file" -define dds:compression=dxt5 "$dest_file"
done

echo "Files converted successfully!"
