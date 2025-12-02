#Alpha-Numeric generation
# params for 10-char alphanumeric backup codes
COUNT=100
LENGTH=10
PLAIN="backup_codes_alnum10.txt"
HASH="backup_hashes_alnum10.txt"

# generate random alphanumeric codes (A-Za-z0-9)
: > $PLAIN
for i in $(seq 1 $COUNT); do
  CODE=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c $LENGTH)
  echo "$CODE" >> $PLAIN
done

# hash with md5
: > $HASH
while read -r c; do
  echo -n "$c" | md5sum | awk '{print $1}' >> $HASH
done < $PLAIN

echo "10-char sample codes:"
head -n 10 $PLAIN
