#!/bin/bash

# filter original 1gram file googlebooks-eng-all-1gram-20120701-1.gz to only lines where the ngram exactly matches a year (18xx, 19xx, or 20xx, where x is a digit)
#   decompress the first using gunzip, zless, zcat or similar
#   then filter out rows that match using grep -E, egrep, awk, or similar
#   write results to year_counts.tsv

# zcat data/birdwatch-public-data-2025-06-16-notes-notes-00000.gz > notes.tsv


#!/bin/bash
 
START_MILLI=1611360000000 #jan 23 2021 12:00:00 AM
END_MILLI=1627775999000 # july 31 2021 23:59:59 PM
OUTPUT_FILE="notes.tsv"
INPUT_FILE="C:\Users\ds3\Desktop\New folder\coursework\week4\community-notes-2025-group-6\birdwatch-public-data-2025-06-16-notes-notes-00000.gz"
#1627696800000
#end time gmt 1627732799000
 
#1611360000000 gmt start time
# Copy header
zcat "$INPUT_FILE" | head -n 1 > "$OUTPUT_FILE"
 
# Filter by createdAtMillis (column 3)
zcat "$INPUT_FILE" | tail -n +2 | awk -F '\t' -v min="$START_MILLI" -v max="$END_MILLI" '{if ($3 >= min && $3 <= max) print $0;}' >> "$OUTPUT_FILE"

# #!/bin/bash
#check out rating format
date -d "2021-01-23T00:00:00Z" +%s000
#Jan 23-  1611360000000
 
date -d "2021-07-31T23:59:59Z" +%s000
#july 27- 1627775999000
 
unzip -p ratings-00000.zip |head
 
#loop through ratings files, extract and filter
for i in $(seq -w 0 19);do
    unzip -p ratings-000${i}.zip | awk -F'\t' 'NR == 1 || ($3 >= 1611360000000 && $3 <= 1627775999000)' > filtered_ratings_${i}.tsv
done
 
#manually moved it to folder for organization
#check no of lines in filtered_notes

#manually deleted empty files after filtered data
#merge remaining rating files, merging headers
head -n 1 filtered_ratings_00.tsv > complete_filtered_ratings.tsv
for i in $(seq -w 0 9); do
    tail -n +2 filtered_ratings_0${i}.tsv >> complete_filtered_ratings.tsv
done

