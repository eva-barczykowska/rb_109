=begin
You are given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1. Empty arrays are equal to 0 in this problem.

# Goal: find the index in an array of integers where the sum of all integers to the left of that index are equal to the sum of the integers on the right of that index

- Input: an array of integers
  - may be positive, negative, or 0
  - may be an empty array (in which case, return 0)
- Output: an integer, representing an index number in the given array
  - sum of all integers to the left of return value is equal to sum of all integers on the right
  - Return -1 if no such index exists
  - 0 represents an empty array
  - the integer element at this index is not included in the summation of integers on either side

# Examples:
[1, 2, 3, 4, 3, 2, 1]
  - 1 + 2 + 3 = 1 + 2 + 3
  - [] = 0
  - [1]
  - [1, 2]
  - [1, 2, 3]
[1, 100, 50, -51, 1, 1]
  - 1 = 50 + -51 + 1 + 1 (1)

# Algorithm:
- Iterate a loop from 0 to the length of the input array, exclusive (array_index)
  - Initialize left to the section of the array starting at array index 0 and extending for the length of array_index
  - Initialize rright to the section of the array fron array_index + 1 to the end of the array
  - Does the sum of left equal the sum of right?
    - If so, return the current index number
- If we get through the whole iteration and never return a value, return -1
=end

def find_even_index(nums)
  return 0 if nums.empty?
  (0...nums.size).each do |index|
    left = nums[0, index]
    right = nums[index + 1..-1]
    return index if left.sum == right.sum
  end
  
  -1
end

p find_even_index([]) == 0
p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
