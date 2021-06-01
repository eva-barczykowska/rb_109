=begin
# Problem:
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

Example
For n = 152, the output should be 52;

For n = 1001, the output should be 101.

Input/Output
[input] integer n

Constraints: 10 ≤ n ≤ 1000000.

[output] an integer; the largest number you can make with exactly one num deleted from input num

# Algorithm:
- Generate an array of all nums with exactly one digit deleted from input num
  - Initialize an empty array to hold results
  - Convert the integer to a string
  - Iterate a loop from 0...size of the string tracking iteration/index
    - Create a copy of the num_string
    - Delete the digit at the current index in the copy of num_string
    - Append the result to the results array as an integer
- Return the largest num in the results array
=end

def delete_digit(num)
  deleted_nums = []
  num_string = num.to_s
  
  (0...num_string.size).each do |index|
    digits = num_string.chars
    digits.delete_at(index)
    deleted_nums << digits.join.to_i
  end
  
  deleted_nums.max
end

p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
