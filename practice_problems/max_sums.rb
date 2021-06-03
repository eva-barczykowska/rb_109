=begin
# Problem
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array or list of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6: [4, -1, 2, 1]
Easy case is when the list is made up of only positive numbers and the maximum sum is the sum of the whole array. If the list is made up of only negative numbers, return 0 instead.

Empty list is considered to have zero greatest sum. Note that the empty list or array is also a valid sublist/subarray.

- Input: an array of integers, either negative or positive, or possibly empty
- Output: an integer, representing greatest sum of contiguous subarray
  - If array is empty, max sum is 0
  - If array is all positive numbers, sum of all array is default greatest sum
  - If array is all negative, return 0

# Algorithm:
- Initialize max_sum to 0
- Guard clauses:
  - If all numbers in array are negative, return max_sum
  - If array is empty, return max_sum
  - If array is all positive numbers, return array sum
- Generate all possible sub-arrays of array
- Iterate over sub-arrays, for each
  - Get the sum
  - If current sum is larger than max_sum, reassign max_sum to current sum
- return max_sum

- Generate all possible sub-arrays
  - Initialize an empty array to hold subs
  - Iterate a loop from 0 to array.size exclusive, tracking iteration (start index)
    - Iterate a loop from start_index to array.size exclusive, tracking iteration (end index)
      - append slice from start index to end index to results array
  - Return results array
=end

def get_subarrs(array)
  sub_arrs = []
  (0...array.size).each do |start_idx|
    (start_idx...array.size).each do |end_idx|
      sub_arrs << array[start_idx..end_idx]
    end
  end
  
  sub_arrs
end

def max_sequence(nums)
  if nums.empty? || nums.all? { |num| num < 0 }
    return 0
  elsif nums.all? { |num| num >= 0 }
    return nums.sum
  end
  
  get_subarrs(nums).map do |sub_arr|
    sub_arr.sum
  end.max
end

p max_sequence([]) == 0
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
