=begin
Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

# Problem:
- Input: an array of positive numbers, and a positive integer
_ Output: an integer representing length of a subarray
  - The sum of the subarray must be greater or equal to s
  - It should be the smallest such subarray within the given array
  - Numbers must be contiguous (no rearranging numbers)

# Examples:
[2,3,1,2,4,3], 7
2
2 + 3
2 + 3 + 1
2 + 3 + 1 + 2
2 + 3 + 1 + 2 + 4
2 + 3 + 1 + 2 + 4 + 3
3
3 + 1
3 + 1 + 2
3 + 1 + 2 + 4
3 + 1 + 2 + 4 + 3
1
1 + 2
1 + 2 + 4
1 + 2 + 4 + 3
2
2 + 4
2 + 4 + 3
4
4 + 3 = 7 **
3

# Algorithm:
- Generate all subarrays from the given array
  - Initialize an empty array to hold results
  - Iterate over the elements in the array from 0 - length -1 tracking index
    - Iterate from the current outer index to length - 1
      - slice that section of subarray
      - add it to a results array
  - Return the results array
- Iterate over the subarr, selecting only those whose sum is greater than or 
  equal to s argument
- Iterate over the selected subarr and find the minimum by length
- Return the size of that subarr
=end

def get_subarrays(array)
  subarrays = []
  (0...array.size).each do |starting_idx|
    (starting_idx...array.size).each do |ending_idx|
      subarrays << array[starting_idx..ending_idx]
    end
  end
  
  subarrays
end

def minSubLength(array, s)
  subarrays = get_subarrays(array)
  subarrays = subarrays.select { |subarr| subarr.sum >= s }
  return 0 if subarrays.empty?
  subarrays.min_by { |subarr| subarr.length }.size
end

p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0
