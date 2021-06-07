=begin
Problem 1: remove vowels from an array of strings
Write a method that takes an array of strings and returns an array of the same string values, except with the vowels removed.

- Input: an array of string elements
- Output: an array of string elements
  - all vowels removed from each string
  
- Return new array or mutate given array?

# Algorithm:
- Iterate over the array of words, transforming as follows
  - Initialize an empty string
  - Iterate over each char in the current word
    - if it is not a vowel, add it to the empty string
  - Return the results string (the block)
- Return the transformed array
=end

def remove_vowels(words)
  words.map do |word|
    no_vowels = ''
    word.each_char do |char|
      'aeiou'.include?(char.downcase) ? next : no_vowels << char
    end
    
    no_vowels
  end
end

p remove_vowels(['green', 'yellow', 'black', 'white']) == ['grn', 'yllw', 'blck', 'wht']
