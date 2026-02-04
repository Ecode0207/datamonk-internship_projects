#!/bin/bash
set -e

# Get the absolute path of the project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

DATA_DIR="$PROJECT_ROOT/data"
OUTPUT_FILE="$DATA_DIR/user_summary.json"

echo "Fetching and processing user data..."
echo "Saving output to: $OUTPUT_FILE"

# Ensure data directory exists
mkdir -p "$DATA_DIR"

API_URL="https://jsonplaceholder.typicode.com/users?_limit=5"

curl -s "$API_URL" | jq '[.[] | {id, name, email}]' > "$OUTPUT_FILE"

echo "Data saved successfully ✅"


