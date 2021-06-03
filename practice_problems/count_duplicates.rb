=begin
# Problem:
Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

- Input: a string
  - containing only alphabetical and numeric digits
  - may be empty
  - may contain either upper or lowercase letters
- Output: an integer
  - representing the number of distinct letters and numbers that occur more than once in the input
  - Letters should be counted in a case insensitive manner

# Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

# Algorithm:
- Initialize a hash
- Convert the input string to all lowercase 
- Iterate over the characters in the lowercase string
  - If the current character appears more than once, add it as a key to the hash
- Return the number of keys in the hash
=end

def duplicate_count(string)
  string = string.downcase
  letters = {}
  string.each_char do |char|
    letters[char] = 1 if string.count(char) > 1
  end
  
  letters.keys.size
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
