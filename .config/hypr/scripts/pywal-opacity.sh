#!/bin/bash

# Define the input and output files
inputFile="$HOME/.cache/wal/colors-waybar.css"
outputFile="$HOME/.cache/wal/rgba_colors.css"

# Ensure the input file exists
if [ ! -f "$inputFile" ]; then
    echo "Input file does not exist."
    exit 1
fi

# Clear the output file if it already exists
> "$outputFile"

# Process each line of the input file
while IFS= read -r line; do
    # Use a corrected regex pattern to match the color definitions
    # Ensure proper syntax for bash
    if [[ $line =~ @define-color[[:space:]]+([a-zA-Z0-9]+)[[:space:]]+\#([0-9a-fA-F]{6}) ]]; then
        # Extract the color name and value using bash regex capture groups
        colorName="${BASH_REMATCH[1]}"
        colorValue="${BASH_REMATCH[2]}"

        # Convert hex color to RGBA components
        r=$(printf "%d" "0x${colorValue:0:2}")
        g=$(printf "%d" "0x${colorValue:2:2}")
        b=$(printf "%d" "0x${colorValue:4:2}")
        a=0.6 # Alpha value

        # Write the new RGBA color definition to the output file
        echo "@define-color $colorName rgba($r, $g, $b, $a);" >> "$outputFile"
    fi
done < "$inputFile"

echo "RGBA colors have been written to $outputFile."
