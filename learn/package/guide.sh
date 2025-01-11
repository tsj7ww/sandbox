#!/bin/bash

# Output file
README="README.md"

# Create/clear the README file
echo "# Project Documentation" > $README
echo "" >> $README
echo "## Table of Contents" >> $README
echo "" >> $README

# Generate table of contents
for file in guides/*.md; do
    # Extract the filename without path and extension
    filename=$(basename "$file" .md)
    # Remove the number prefix and convert underscores to spaces
    title=$(echo "$filename" | sed 's/^[0-9]*_//' | sed 's/_/ /g')
    # Capitalize first letter of each word
    title=$(echo "$title" | awk '{for(i=1;i<=NF;i++)sub(/./,toupper(substr($i,1,1)),$i)}1')
    # Add to table of contents
    echo "- [$title](#${title,,})" >> $README
done

echo "" >> $README

# Function to process markdown files
process_file() {
    local file=$1
    
    # Extract title from filename
    filename=$(basename "$file" .md)
    title=$(echo "$filename" | sed 's/^[0-9]*_//' | sed 's/_/ /g')
    title=$(echo "$title" | awk '{for(i=1;i<=NF;i++)sub(/./,toupper(substr($i,1,1)),$i)}1')
    
    # Add section header
    echo "## $title" >> $README
    echo "" >> $README
    
    # Add content, skipping any existing headers
    sed '/^#/d' "$file" >> $README
    echo "" >> $README
    echo "---" >> $README
    echo "" >> $README
}

# Process each markdown file in numerical order
for file in guides/[0-9]*.md; do
    process_file "$file"
done

echo "Documentation has been compiled into $README"

# Optional: Remove duplicate blank lines and cleanup
awk 'NF > 0 {blank=0} NF==0 {blank++} blank<=2' $README > temp.md && mv temp.md $README