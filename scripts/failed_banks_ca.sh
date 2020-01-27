mkdir Assignment_1
cd Assignment_1
wget https://www.fdic.gov/bank/individual/failed/banklist.csv
touch failed_banks_ca.csv
head -n 1 banklist.csv > failed_banks_ca.csv
grep CA banklist.csv >> failed_banks_ca.csv
wc -l failed_banks_ca.csv