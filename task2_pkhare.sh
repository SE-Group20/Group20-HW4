grep "banana" sample_pkhare.txt > output_pkhare_task2/banana_lines.txt

grep -v "banana" sample_pkhare.txt > output_pkhare_task2/non_banana_lines.txt

sort sample_pkhare.txt | uniq > output_pkhare_task2/unique_lines.txt

grep "banana" sample_pkhare.txt | sort | uniq -c > output_pkhare_task2/banana_counts.txt
