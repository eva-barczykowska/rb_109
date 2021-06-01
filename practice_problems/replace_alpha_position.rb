=begin
In this kata you are required to, given a string, replace every letter 
with its position in the alphabet.

If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.

- Input: a string containing one or more words
  - may be alphabetical characters or otherwise
  - may contain upper and lower case letters
- Output: a string, with each letter from the input string replaces 
with it's position in the alphabet
  - Separate numbers with spaces
  - Do not output any numbers for non-alphabetical characters
  - The position in the alphabet is not case sensitive

Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

# Algorithm:
- Initialize an ALPHABET constant with all the letters
- Initialize an empty array
- Iterate over each character in the given string, lowercased
  - next iteration if it is not a letter
  - Get the current letter's position in the alphabet and append it to the results array as a string
- Join and return the results array
=end

ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

def alphabet_position(sentence)
  result = []
  
  sentence.downcase.each_char do |char|
    next unless ALPHABET.include?(char)
    result << (ALPHABET.index(char) + 1).to_s
  end
  
  result.join(' ')
end


p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""
