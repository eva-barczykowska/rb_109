=begin
# Problem:
6 kyu
In this kata, you must create a digital root function.

A digital root is the recursive sum of all the digits in a number. Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.

- Input: an integer
- Output: an integer, representing digital root of input
  - digital root = add the digits in the input num together until there is only one digit

# Examples:

digital_root(16)
=> 1 + 6
=> 7

digital_root(942)
=> 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6

digital_root(132189)
=> 1 + 3 + 2 + 1 + 8 + 9
=> 24 ...
=> 2 + 4
=> 6

digital_root(493193)
=> 4 + 9 + 3 + 1 + 9 + 3
=> 29 ...
=> 2 + 9
=> 11 ...
=> 1 + 1
=> 2

# Algorithm:
- Convert the input number into an array of digits
- If the array of digits only has one number, return that number
- Add all the digits of the array together to get the sum
- Call the method on the sum
=end

def digital_root(num)
  digits = num.digits
  return digits.first if digits.size == 1
  digital_root(digits.sum)
end

p digital_root(16) == 7
p digital_root(456) == 6
