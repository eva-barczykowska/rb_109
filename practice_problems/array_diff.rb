=begin
Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.

It should remove all values from list a, which are present in list b.

array_diff([1,2],[1]) == [2]
If a value is present in b, all of its occurrences must be removed from the other:

array_diff([1,2],[1]) == [2]

- Input: two arrays
  - each containing integer elements, or empty
- Output: an array
  - containing the elements from the first array that do not appear in the second array
  - if the second array is empty, return the first array
  - if the first array is empty, return an empty array

# Examples:
[1, 2] - [1] => [2] get rid of the element in arr1 that occurs in arr2 (1)
[1, 2, 2] - [1] => [2, 2] same as above
[1, 2, 2] - [2] => [1] get rid of all instances of an element from arr2 in arr1
[1, 2, 2] - [] => [1, 2, 2] subtracting an empty array is the equivalent of subtracting 0
[] - [1, 2] => [] the first array is already empty so there are no elements to remove

# Algorithm:
- Iterate over list b with list a
  - Remove the current item from list b from list a if it exists in list a
- Return the mutates list a
=end

def array_diff(arr1, arr2)
  arr2.each do |num|
    arr1.delete(num) if arr1.include?(num)
  end
  
  arr1
end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
