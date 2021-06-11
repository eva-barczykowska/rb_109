=begin
The maximum sum subarray problem consists of finding the maximum sum of a contiguous subsequence in an array of integers.

Example:
max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 #=> [4, -1, 2, 1]

The easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array. If the array is made up of negative numbers, return 0 instead. 

An empty array is considered to have zero greatest sum. Note that the empty array is also a valid subarray

# Goal:
Given an array of integers, either positive, negative, or 0, return the maximum sum of a subarray from the given array

- Input: an array of integers
  - May be empty (in which case, max sum is 0)
  - May be negative or positive integers
- Output: an integer
  - Representing the maximum sum of any one subarray (or slice) of the the given array
  - If given array is all positive, return max sum of whole array
  - If given array is all negative, return 0

# Example: 
[-2, 1, -3, 4, -1, 2, 1, -5, 4]
-2, -1, -4, 0, -1, 1, 2, -3, 1, 1, -2, 2, 1, 3, 4, -1, 3, 1, 0, 2, 3, ... etc

# Algorithm:
- Generate an array of all possible sub-arrays from the given array
- Initialize a current max sum variable to 0
- Iterate over the sub-arrays
  - If the sum of the current sub-array is greater than the current max sum
    - Reassign current max sum to the sum of the current subarray
- Return the current max sum

- Generate an array of all possible sub-arrays from the given array
  - Initialize an empty array to hold our results
  - Iterate a loop from 0 up to the size of the input array exclusive, tracking iteration (start i)
    - Iterate a loop from start i up to the size of the input array exclusive, tracking iteration (end i)
      - Append the slice of the array that extends from start i to end i to the results array
  - Return the results array
=end

def get_all_subarrs(nums)
  subs = []
  (0...nums.size).each do |start_i|
    (0...nums.size).each do |end_i|
      subs << nums[start_i..end_i]
    end
  end
  
  subs.select { |sub| sub.size > 0 }
end

def max_sequence(nums)
  sequences = get_all_subarrs(nums)
  
  max_sum = 0
  sequences.each do |sequence|
    current_sum = sequence.sum
    max_sum = current_sum if current_sum > max_sum
  end
  
  max_sum
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
