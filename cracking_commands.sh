#Cracking Pipeline
john --mask='?d?d?d?d?d?d?d?d' backup_hashes.txt --fork=4
john --format=raw-md5 backup_hashes_alnum10.txt \
     --prince=common_substrings.txt \
     --fork=4
john --markov=300 --format=raw-md5 backup_hashes_alnum10.txt
john --incremental=Alnum --format=raw-md5 backup_hashes_alnum10.txt
