BEGIN {
  FS = ","  # Set field separator to comma
  getline   # Skip header row
}

{
  class = $3   # Assuming Pclass is the 3rd column
  survived = $2 # Assuming Survived is the 2nd column

  if (survived == 1) {
    class_survival[class]++
  }
  class_total[class]++ # Total count for each class, including survivors and non-survivors
}

END {
  for (class in class_total) {
    survival_rate = (class_survival[class] / class_total[class]) * 100
    printf "Survival rate for Class %s: %.2f%%\n", class, survival_rate
  }
}
