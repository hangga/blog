PROJECT_DIR="$PWD"
IMAGE_DIR="$PWD"

DELETE_FLAG=false

# Check for -d (delete) flag
if [[ $1 == "-d" ]]; then
    DELETE_FLAG=true
fi

# Find all image files
find $IMAGE_DIR -type f \( -iname \*.png -o -iname \*.jpg -o -iname \*.jpeg -o -iname \*.gif -o -iname \*.webp -o -iname \*.svg -o -iname \*.ico \) | while read img_file; do
    # Extract the basename of the image file
    img_basename=$(basename "$img_file")
    
    # Search for it in the project, excluding .zip files and .git directories
    result=$(grep -ril --exclude=*.zip --exclude-dir=.git "$img_basename" "$PROJECT_DIR")
    
    # If not found, print it or delete it based on flag
    if [ -z "$result" ]; then
        echo "Unused image: $img_file"
        if $DELETE_FLAG; then
            rm "$img_file"
            echo "Deleted: $img_file"
        fi
    fi
done
