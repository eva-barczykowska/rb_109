=begin
NOTE: this isn't quite efficent enough to solve in codewars.

# Problem:
Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

There are tests with strings up to 10 000 characters long so your code will need to be efficient.

The input will only consist of lowercase characters and will be at least one letter long.

If there are multiple solutions, return the one that appears first.

- Input: a string
  - Only includes lowercase alphabetical characters
- Output: the longest substring from the input string in which the chars appear in alphabetical order

# Algorithm:
- Generate alphabetical substrings:
  - Initialzea results array to hold the substrings
  - Iterate from 0...size of input, tracking iteration (start index)
    - Iterate from start index...size of input, tracking iteration (end index)
      - Get the section of the input string that goes from start index to end index
      - Add it to the results array if it is alphabetical?
  - Return the alphabetical substrings
- Find the longest alphabetical substring
  - Sort by length and return the maximum element
- Is is alphabetical?
  - Convert the substring to an array of chars
  - See if this is equal to the same array of chars, sorted in alphabetical order
=end

def alphabetical?(string)
  string.chars == string.chars.sort
end

def alphabetical_substrings(string)
  substrings = []
  (0...string.size).each do |start_idx|
    (start_idx...string.size).each do |end_idx|
      current_sub = string[start_idx..end_idx]
      substrings << current_sub if alphabetical?(current_sub)
    end
  end
  
  substrings
end

def longest(string)
  alphabetical_substrings(string).max_by { |sub| sub.length }
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

# Option 2

def alphabetical2?(string)
  string.chars == string.chars.sort
end

def longest2(string)
  longest_sub = ''
  characters = string.chars
  
  (1..string.size).each do |sub_length|
    characters.each_cons(sub_length) do |sub|
      substr = sub.join
      if alphabetical2?(substr) && longest_sub.size < substr.size
        longest_sub = substr
      end
    end
  end
  
  longest_sub
end

p longest2('asd') == 'as'
p longest2('nab') == 'ab'
p longest2('abcdeapbcdef') == 'abcde'
p longest2('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest2('asdfbyfgiklag') =='fgikl'
p longest2('z') == 'z'
p longest2('zyba') == 'z'
