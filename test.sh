#!/bin/sh
set -e
echo ">>> Rsync version:"
rsync --version
echo ">>> Generating a 2GB random file"
openssl rand -out large.txt -base64 $(( 2**31 * 3/4 ))
echo ">>> Compressing... with gzip rsyncable"
gzip --rsyncable large.txt
echo ">>> RSYNC: Use password 123456"
rsync -z --progress large.txt.gz server:/
