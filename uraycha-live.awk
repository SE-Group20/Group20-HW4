#To execute : gawk -f uraycha-live.awk titanic.csv

BEGIN {
    FS = ","
}

NR > 1 {
    class = $3   #Pclass is 3rd column
    survived = $2 #Survived is 2nd column

    if (survived == 1) s_count[class]++
    count[class]++
}

END {
    #Print survival rate per class
    for (cls in s_count) {
        print "Survival frequency of class " cls " : " (s_count[cls] / count[class]) * 100 "%"
    }
}
