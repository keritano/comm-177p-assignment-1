# FEEDBACK Nice work overall. I especially
# appreciated how you used all built-in shell
# commands. One virtue of this approach is that
# it makes the code more portable (i.e. anyone
# with a shell could run this without having to
# first install csvkit). Also, nice use of
# shell variables throughout.
# A few notes:
# - There's no need to pre-generate failed_banks_ca.csv
#   using "touch" since it will automatically be created when you
#   redirect the output of "head".
# - The "shebang" line must always be at the top of the file.
# - Using wget without specifying an output file will cause
#   subsequent runs of the script to save banklist to numerically
#   suffixed files such as banklist.csv.1. That means the script
#   will only read the original banklist.csv and therefore not
#   reflect data updates.


wget https://www.fdic.gov/bank/individual/failed/banklist.csv
touch failed_banks_ca.csv
head -n 1 banklist.csv > failed_banks_ca.csv
grep CA banklist.csv >> failed_banks_ca.csv

# NOTE: The shebang line should always goes at the top of the file.
#   https://en.wikipedia.org/wiki/Shebang_(Unix)
#!/bin/bash
bnkcnt=0
bnkcnt=$(cat failed_banks_ca.csv| wc -l)
bnkcnt=$(($bnkcnt -1))

STR="There are $bnkcnt failed banks in CA."
echo $STR
