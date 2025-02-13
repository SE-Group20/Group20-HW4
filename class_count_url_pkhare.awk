BEGIN {
  # Download the file, handling potential errors
  command = "curl -s '" url "' > temp.csv"
  return_code = system(command)

  if (return_code != 0) {
    print "Error downloading file. Check the URL. Curl exited with code " return_code > "/dev/stderr"
    exit 1
  }

  # Check if the downloaded file is empty or contains only whitespace (more robust)
  empty_check_command = "grep -E '^ *$' temp.csv" # Check for empty or whitespace-only lines
  empty_check_result = system(empty_check_command)

   if (empty_check_result == 0) { # grep found only whitespace or nothing
    print "Error: Downloaded file is empty or contains only whitespace. Check the URL or network." > "/dev/stderr"
    system("rm temp.csv")  # Clean up even if only whitespace
    exit 1
  }

  # Set field separator to comma (CSV) - Important!
  FS=","

  # Skip the header line (if present) - Important!
  getline  # Read and discard the first line (header)
}

{
  class = $3 # Adjust $3 if Pclass is in a different column
  class_counts[class]++
}

END {
  for (class in class_counts) {
    print "Class", class, ":", class_counts[class], "passengers"
  }

  if (return_code == 0) {  # Only remove if download was successful (and not just whitespace)
    system("rm temp.csv")
  }
}
