=begin
Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive alphabetic 
characters and numeric digits that occur more than once in the input string. 
The input string can be assumed to contain only alphabets (both uppercase and 
lowercase) and numeric digits.

# Input - a string
  - Only alpha numeric characters
  - may be an empty string
# Output - an integer
  - representing the number of characters that occur more than once
  - both alphabetical and numerical
  - case insensitive, ie. Aa => 1, a
  - if input is empty return 0


Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

# Algorithm:
- Initialize a count hash with default value of 0
- Iterate over each character in the string
  - If the current character (lowercase) occurs in the string (downcase) more than
    once, 
      - add it as a key to the hash
      - This way, when we come accross the duplicate char it will overwrite the 
        hash key that we have already
- Return the number of keys in the hash
=end

def duplicate_count(string)
  counts = {}
  string.each_char do |char|
    if string.downcase.count(char.downcase) >= 2
      counts[char.downcase] = 0
    end
  end

  counts.size
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2