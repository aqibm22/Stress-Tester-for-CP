#!/bin/bash

green=$(tput setaf 71);
red=$(tput setaf 1);
blue=$(tput setaf 32);
orange=$(tput setaf 178);
bold=$(tput bold);
reset=$(tput sgr0);


g++ -std=c++17 gen.cpp -o generator || { echo ${bold}${orange}Compilation Error in ${reset} gen.cpp; exit 1; }
g++ -std=c++17 solution.cpp -o original || { echo ${bold}${orange}Compilation Error${reset} in solution.cpp; exit 1; }
g++ -std=c++17 brute.cpp -o brute || { echo ${bold}${orange}Compilation Error${reset} in brute.cpp; exit 1; }

diff_found=0
i=1
max_tests=100

while [[ $i -le $max_tests ]]
do
    
    ./generator > input1.txt

    ./original < input1.txt > original_output.txt 

    ./brute < input1.txt > brute_output.txt

    if diff --tabsize=1 -F --label --side-by-side --ignore-space-change original_output.txt brute_output.txt > dont_show_on_terminal.txt; then
        echo "${orange}test_case #$i: ${bold}${green}passed${reset}"
    else
        echo "${orange}test_case #$i: ${bold}${red}failed${reset}"
        diff_found=1
        break
    fi
    i=$((i+1))
done

if [ $diff_found -eq 1 ]
then
    echo "${blue}Input: ${reset}"
    cat input1.txt
    echo ""

    echo "${blue}Output: ${reset}"
    cat original_output.txt
    echo ""

    echo "${blue}Expected: ${reset}"
    cat brute_output.txt
    echo ""

    echo "Wrong Answer"
else
    echo "Accepted"
fi

