=begin
Given two arrays a and b write a function comp(a, b) that checks whether the two arrays have the "same" elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

Examples
Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

a = [121, 144, 19, 161, 19, 144, 19, 11] 
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
Invalid arrays
If we change the first number to something else, comp may not return true anymore:

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.

Remarks
a or b might be [] (all languages except R, Shell).
a or b might be nil or null or None or nothing (except in Haskell, Elixir, C++, Rust, R, Shell, PureScript).
If a or b are nil (or null or None), the problem doesn't make sense so return false.

Note for C
The two arrays have the same size (> 0) given as parameter in function comp.

# Goal: given two arrays, determine if all the elements in the 2nd array are squares of all the elements in the first array

- Input: two arrays, elements are integers
  - arrays may be empty (in which case return false)
  - arrays may be nill (in which case return false)
- Output: boolean
  - true if all elements in 2nd array argument are squares of the elements in the 1st array argument, false otherwise

# Algorithm:
- Return false if either array is empty, or nil
- Reassign both array arguments to sorted arrays
- Iterate a loop from 0 up to length of array a exclusive, tracking i (index)
  - return false if the element at current index in b is not equal to the element at current index in a squared
- If we make it though all iterations, return true
=end

def valid_arrays?(arr_a, arr_b)
  (arr_a && arr_b) && 
  (arr_a.size > 0 && arr_b.size > 0) &&
  arr_a.size == arr_b.size
end

def comp(arr_a, arr_b)
  return false unless valid_arrays?(arr_a, arr_b)
  
  arr_a = arr_a.sort
  arr_b = arr_b.sort
  
  (0...arr_a.size).each do |index|
    return false unless arr_b[index] == arr_a[index]**2
  end
  
  true
end

p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false
