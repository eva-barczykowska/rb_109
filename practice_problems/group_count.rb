=begin
Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}
The following methods were disabled:

Array#count
Array#length

# Goal: given an array, return a hash where each key is one unique value from the array and the value is the amount of times that element occurs. Do not use #count of #length

- Input: an array of integers
  - may be empty, in which case return nil
  - may be nil, in which case return nil
- Output: a hash
  - each key is an integer representing one of the elements from the array
  - each value is an integer representing how many times that value occurs

# Algorithm:
- Make sure input is valid
  - return nil if the array is empty or it is nil
- Initialize an empty hash to hold results, set default value to 0
- Iterate over the input array
  - Access the current element's key in the hash and increment the value by 1
- Return the resulting hash
=end

def group_and_count(nums)
  return nil unless nums && !(num.empty?)
  
  nums.each_with_object(Hash.new(0)) do |num, counts|
    counts[num] += 1
  end
end

p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}
