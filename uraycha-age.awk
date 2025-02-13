#To execute : gawk -f uraycha-age.awk titanic.csv

BEGIN {
    FS = ","
}
NR > 1 {
    # Age is the 6th column
    # using 7 as the field separator is , and the name column contains an additonal comma
    age = $7
    
    if (age != "") {
        total_age += age
        count++
    }
}
END {
    if (count > 0){
        print "Avg age of passengers: " total_age/count
    }
    else print "Invalid age data."
}