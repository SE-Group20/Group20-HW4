#To execute : gawk -f uraycha-class.awk titanic.csv

BEGIN {
    FS = ","   # Specify the field separator as a comma
}
#Pclass is the 3rd column
NR > 1 {
    class_count[$3]++
}

END {
    for (cc in class_count) {
        print "No. of passengers in class " cc ": " class_count[cc]
    }
}
