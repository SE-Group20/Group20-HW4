NR>1 {
  age = $7
  clean_age = age
  gsub(/[^0-9.]/, "", clean_age)

  if (clean_age != "" && clean_age ~ /^[0-9]+(\.[0-9]+)?$/) {
    sum += clean_age
    count++
  }
}
END {
  if (count > 0) {
    printf "Average Age: %.2f\n", sum / count
  } else {
    print "No valid age data found."
  }
}
