=begin
Find the length of the longest substring in the given string that is the same in reverse.

Example:
longest_palindrome("I like racecars that go fast") == 7

If the length of the input string is 0, return value must be 0

# Goal: find the length of the longest substring in a given string that is also a palindrome

- Input: a string
  - consisting of any number of chars
  - May be empty, in which case return 0
- Output: an integer, length of longest palindrome substring
  - a valid substring has a length of 1 or more

# Algorithm:
- Generate an array of all the substrings
- Iterate over the array, selecting only those substrings that are palindromes
- Return the length of the longest remaining substring

- Generate an array of all the substrings
  - Initialize an empty array to hold our results
  - Iterate a loop from 0 to the length of the string, exclusive, tracking i (start_i)
    - Iterate a loop from start_i to the length of the string, exclusive, tracking i (end_i)
      - Get the section of the string from start_i to end_i and append it to the results array
  - Return the results array

- Is it a palindrome?
  - true if string is equal both backwards and forwards
  - false otherwise
=end

def get_substrings(string)
  subs = []
  (0...string.length).each do |start_i|
    (start_i...string.length).each do |end_i|
      subs << string[start_i..end_i]
    end
  end
  
  subs
end

def palindrome?(string)
  string == string.reverse
end

def longest_palindrome(string)
  return 0 if string.empty?
  palindromes = get_substrings(string).select do |sub|
    palindrome?(sub) 
  end
  
  palindromes.map { |sub| sub.size }.max
end

puts longest_palindrome('') == 0
puts longest_palindrome('a') == 1
puts longest_palindrome('aa') == 2
puts longest_palindrome('baa') == 2
puts longest_palindrome('aab') == 2
puts longest_palindrome('baabcd') == 4
puts longest_palindrome('baab1kj12345432133d') == 9
puts longest_palindrome("I like racecars that go fast") == 7
