=begin
# Problem:
Task :
Given a List [] of n integers , find the minimum number to be inserted in a list, so that the sum of all elements of the list should equal the closest prime number .

Notes
List size is at least 2 .

List's numbers will only have positives (n > 0) .

Repetition of numbers in the list could occur .

The newer list's sum should equal the closest prime number .

- Input: an array of nums
  - All numbers will be at least 1
  - List will never be less than 2 elements
  - May include duplicates
- Output: a number, representing smallest number to cause the sum of all input nums to equal prime
  - A prime number is any number divisible only by itself and 1

Input >> Output Examples

1- minimumNumber ({3,1,2}) ==> return (1)
Explanation:
Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime number is (1) , which will make *the sum of the List** equal the closest prime number (7)* .

2-  minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:
Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , which will make *the sum of the List** equal the closest prime number (37)* 

3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:
Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime number is (2) , which will make *the sum of the List** equal the closest prime number (191)* .

# Algorithm:
- Initialize a counter to 0
- Initialize num_sums to the sum of all numbers in the input array
- Iterate a loop
  - Set the sum equal to the sum of the input array + the current counter
  - Break the loop if the resulting sum is a prime number
  - Increment the counter
- Return the counter

- Is it a positive prime number?
  - If less than or equal to 2, return true
  - Iterate a loop from 2 upto the number to check, tracking iteration
    - If the number is ever evenly divisible by the current iteration, return false
  - Return true
=end

def positive_prime?(n)
  return true if n <= 2
  (2...n).none? { |i| n % i == 0 }
end

def minimum_number(nums)
  counter = 0
  num_sums = nums.sum
  
  loop do
    sum = num_sums + counter
    break if positive_prime?(sum)
    counter += 1
  end
  
  counter
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2
