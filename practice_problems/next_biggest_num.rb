=begin
You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits:

12 ==> 21
513 ==> 531
2017 ==> 2071
If no bigger number can be composed using those digits, return -1:
9 ==> -1
111 ==> -1
531 ==> -1

# Problem:
Given an integer, return the next largest number that can be formed using the same digits as the given number, or if no such number is possible, return -1

- Input: an integer
  - A positive integer, greater than 0
- Output: an integer
  - The next biggest number than can be formed with digits from the input number
  - Or, if no such num, -1

# Examples:
12
  - 12
  - 21
=> 21

513
  - 513
  - 531
  - 315
  - 351
  - 135
  - 153
=> 531

531
  - 513
  - 531
  - 315
  - 351
  - 135
  - 153
=> -1

# Algorithm:
  - Get an array of all the permutations of the input number
  - Select only those numbers that are greater than the input number
  - If the resulting array is empty, return -1
  - Otherwise, return the smallest of the numbers that are greater than the input number

- Get an array of all the permutations of the input number
  - Initialize an empty array to hold results
  - Convert the current number to an array of digits
  - Generate all permutations the same size of the calling array
  - (This will result in a nested array, where each sub is an array of digits)
  - Iterate over each digits subarray
    - Iterate over each digit
      - Convert that digit to a char
    - Join the array of string digits and generate a string
    - Convert the string to an integer
  - Return the array of all integers that are permutations of the input num
=end

def get_permutations(num)
  nums = []
  digits = num.digits.reverse
  digits.permutation(digits.size) do |sub_arr|
    nums << sub_arr
  end
  
  nums.map! do |sub_arr|
    sub_arr.map! do |num|
      num.to_s
    end
    sub_arr.join.to_i
  end
  
  nums
end

def next_bigger_num(num)
  possible_nums = get_permutations(num).select do |n|
    n > num
  end
  
  possible_nums.empty? ? -1 : possible_nums.min
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
