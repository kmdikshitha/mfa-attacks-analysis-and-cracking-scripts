#8-Digit Numeric Code Generation
# parameters
COUNT=100        # number of backup codes
LENGTH=8         # digit length (8-digit codes)
PLAIN="backup_codes.txt"
HASH="backup_hashes.txt"

# generate 8-digit numeric codes (random)
: > $PLAIN
for i in $(seq 1 $COUNT); do
  CODE=$(shuf -i 0-99999999 -n 1 | awk '{printf("%08d\n",$1)}')
  echo "$CODE" >> $PLAIN
done

# create raw MD5 hashes (John expects hex)
: > $HASH
while read -r c; do
  echo -n "$c" | md5sum | awk '{print $1}' >> $HASH
done < $PLAIN

echo "Generated sample backup codes:"
head -n 10 $PLAIN

echo "Generated hashes:"
head -n 10 $HASH
