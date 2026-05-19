#!/bin/bash
set -e
echo "Reassembling file..."
cat *.part > "reconstructed_file"
echo "Verifying..."
sha256sum -c checksum.txt
if [ $? -eq 0 ]; then
   mv "reconstructed_file" "$(cat checksum.txt | cut -d ' ' -f 3-)"
   echo "✅ Success!"
   ls -lh "$(cat checksum.txt | cut -d ' ' -f 3-)"
else
   echo "❌ Error: File corrupted"
   exit 1
fi
