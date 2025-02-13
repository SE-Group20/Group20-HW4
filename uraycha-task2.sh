echo "uraycha:"
echo

#creating the sample txt file
cat > uraycha-sample.txt <<EOF
apple
banana
apple
cherry
banana
banana
date
EOF

#finding all lines containing banana
echo "a. Lines containing 'banana' are:"
grep -n "banana" sample.txt
echo

#Lines that do not contain banana
echo "b. Lines not containing 'banana' are:"
grep -n -v "banana" sample.txt
echo

#Using uniq to find unique lines
echo "c. Unique lines are:"
sort sample.txt | uniq
echo

#using -c from man uniq to count the occurence of each word
echo "d. Unique lines with occurences are:"
sort sample.txt | uniq -c
echo

#combining grep and uniq to find occurences of lines containing banana
echo "e. Lines containing 'banana' with occurence:"
grep "banana" sample.txt | uniq -c
echo