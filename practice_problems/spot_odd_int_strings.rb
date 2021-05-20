=begin
# Given a string of integers, return the number of odd-numbered substrings that 
can be formed.

# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, 
a total of 7 numbers.

# solve("1341") = 7. See test cases for more examples.

# Problem:
  - Input: a string of numerical digits
  - Output: an integer
    - represents how many substring of those digits are odd integers
    - The odd integers formed can be of any length from 1 up to the length of 
      the input string
    - If there are two duplicate digits in the input string that are odd, they
      can be represented twice as "odd substrings"
    - Do not rearrange the given digits

# Examples:
- Ex1 '1341'
  - 1, 1, 3, 41, 341, 1341
  - [str[0..-1], str[1..-1], str[2..-1]
  - [str[0, 1], str[0, 2], str[0, 3] ... [str[0, length of str]
- Ex2 '1357'
 - 1, 3, 1, 13, 1341, 341, 41
 
# Algorithm:
- Get a list of all the substrings that can taken from the input string
  - Generate an array of substrings beginning with each character of the string ([])
  - Iterating a loop tracking index / iterations from 0 to the length of the string - 1
    - Slice the string starting at the current index and append it to the substrings array
  - For each substring, generate an array of leading substrings for each
    - Iterate over the substrings array tracking length
    - Slice the the current section of the current substring with the current length 
    - Add to leading substrings array
- Flatten the array to one dimension if necessary
- Iterate over all the substrings, convert each to an integer
- Select only those integers that are odd
- Return a count of the selected odd integers
=end

def leading_substrings(str_num)
  substrings = []
  1.upto(str_num.size) do |length|
    substrings << str_num[0, length]
  end
  substrings
end

def get_all_substrings(str_num)
  substrings =[]
  (0...str_num.size).each do |index|
    substrings += leading_substrings(str_num[index..-1])
  end
    
  substrings
end

def solve(str_num)
  substrings = get_all_substrings(str_num)
  substrings.select { |substring| substring.to_i.odd? }.count
end

# TODO: think of test cases