# Base URL for the ratings data
baseUrl="https://ton.twimg.com/birdwatch-public-data/2025/06/16/noteRatings/ratings-"
 
# Output directory for downloaded files
outputDir="C:\Users\ds3\Desktop\New folder\coursework\week4\community-notes-2025-group-6\data"
 
# Ensure the output directory exists
mkdir -p "$outputDir"
 
# Loop through numbers 00000 to 00019
for i in {0..19}; do
    # Format the number with leading zeros
    num=$(printf "%05d" $i)\
 
    # Construct the full URL
    url="${baseUrl}${num}.zip"
 
    # Download the file
    echo "Downloading $url..."
    curl -s -O "$url" -o "${outputDir}/ratings-${num}.zip"
done
 
echo "All downloads complete."