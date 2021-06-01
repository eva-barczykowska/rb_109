=begin
# Problem:
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once.

- Input: an integer n
  - representing the end of a range 1..n
- Output: an integer
  - the sum of all multiples of 3 or 5 between 1 and n (exclusive)
  - If a number is a multiple of both 3 & 5 count it once

# Algorithm:
- Initialize an array to hold the results
- Iterate a loop from 1 upto the input num, tracking current iteration
  - if current iteration is multiple of 3 & 5, append it to the array
  - if current iteration is multiple of 3, append it to the array
  - if current iteration is a mulitple of 5, append it to the array
- sum the results array and return the result
=end

def solution(n)
  multiples = []
  (1...n).each do |i|
    next unless i % 3 == 0 || i % 5 == 0
    multiples << i
  end
  
  multiples.sum
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168
