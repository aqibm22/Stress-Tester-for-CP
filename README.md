# Stress Tester for Competitive Programming 

## Steps - 
  1. Write your optimal/efficient solution in [optimal.cpp](https://github.com/aqibm22/Stress-Tester-for-CP/blob/main/optimal.cpp)
  2. Write the brute force solution in [brute_force.cpp](https://github.com/aqibm22/Stress-Tester-for-CP/blob/main/brute_force.cpp)
  3. Modify the generate_test() function in [generator.cpp](https://github.com/aqibm22/Stress-Tester-for-CP/blob/main/generator.cpp) as per the input required. 
  4. Run [tester.sh](https://github.com/aqibm22/Stress-Tester-for-CP/blob/main/tester.sh) in terminal. (Linux Shell for Windows) 
  
## Program flow -
  1. The tester invokes the generator and it creates input.txt
  2. Both optimal.cpp and brute_force.cpp reads from input.txt and give their output in optimal_output.txt and brute_output.txt respectively.
  3. The tester then compares optimal_output.txt and brute_output.txt and check if they are identical 
      1. If they are identical, tester prints 'passed' and the program continues.
      2. If there is a mismatch, then 'failed' is printed along with the contents of both the files along with the input file and the program terminates. 
  4. If the tester has run for the given number of tests (variable max_tests in tester.sh) and there is no mismatch then the program will terminate printing 'Accepted'.  
  
## Note - 
  1. Generator is capable of generating a random graph,tree,string etc. Just call the respective functions with the desired constraints. 
  2. In case of multiple solution possible for a given input, then even if optimal solution is correct but it will be shown as wrong if it does not 
     match with the brute force solution. This is a limitation. 
  
Here is a snapshot of tester detecting a mismatch on test no. 8 - </br>
![op_stress_testing](https://user-images.githubusercontent.com/43511795/125153296-598e0b00-e170-11eb-8ffa-2218ea3a3a8b.PNG)
