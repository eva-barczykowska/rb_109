=begin
You are given an array that contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

You can assume there is never an empty array and there will always be an integer.

Goal: Given an array of positive and negative integers, return an array that consists of those integer values, except for identical consecutive integers in the original array, there should be only one element in the return value, the sum of the consecutive indentical integers

- Input: an array of integers
  - will not be empty
  - consisting of at least one integer
- Output: an array of integers
  - same integer values as input array
  - any consecutive equal integer elements from input should be lumped together into one "sum" element

# Examples:
[1,4,4,4,0,4,3,3,1,1]
  - 1, next ele is 4, append 1 to results array
  - 4, next ele is 4, create sum to 4 + 4 (8)
  - 4, next ele is 4, create sum to previous sum + 4 (12)
  - 4, next ele is 0, append sum to results array
  - 0, next ele is 4, append 0 to results array
  - 4, next ele is 3, append 4 to results array
  - 3, next ele is 3, create sum to 3 + 3 (6)
  - 3, next ele is 1, append sum to results array
  - 1, next ele is 1, create sum to 1 + 1 (2)
  - 1, there is no next ele, append sum to results array

# Algorithm:
  - Initialize an empty array to hold our results
  - Initialize a current sum variable to 0
  - Iterate over the input array, with index
    - Does the next element equal the current element?
      - if yes, sum += current element
    - Is the previous element equal to the current element?
      - if yes, sum += current element
      - append sum to the results array
      - reassign sum to 0 (reset for next consecutive integers)
    - Otherwise, append the current element to the results array
  - return the results array
=end

def sum_consecutives(nums)
  results = []
  current_sum = 0
  nums.each_with_index do |num, idx|
    if num == nums[idx + 1]
      current_sum += num
    elsif num == nums[idx - 1]
      current_sum += num
      results << current_sum
      current_sum = 0
    else
      results << num
    end
  end
  
  results
end

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]
