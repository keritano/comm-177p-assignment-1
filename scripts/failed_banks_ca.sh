wget https://www.fdic.gov/bank/individual/failed/banklist.csv
touch failed_banks_ca.csv
head -n 1 banklist.csv > failed_banks_ca.csv
grep CA banklist.csv >> failed_banks_ca.csv

#!/bin/bash
bnkcnt=0
bnkcnt=$(cat failed_banks_ca.csv| wc -l)
bnkcnt=$(($bnkcnt -1))

STR="There are $bnkcnt failed banks in CA."
echo $STR
