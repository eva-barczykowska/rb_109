=begin
Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates). For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.

- Input: an array of strings
  - each element represents a word
  - consists only of lowercase alphabetical letters
- Output: an array of characters
  - Each character represents a character that occurs in all the words in the given array
  - If a character occurs more than once in all the elements of the input array, include it as many times as it occurs
  - However, the duplicate must exist in all elements

# Examples:
['bella', 'label', 'roller']
b -> 1, 1, 0
e -> 1, 1, 1
l -> 2, 2, 2 *
l -> 2, 2, 2 *
a -> 1, 1, 0
['e', 'l', 'l'] (each appears in all three array elements)

{'b' => [1, 1, 0], 'e' => [1, 1, 1], 'l' => [2, 2, 2], 'a' => [1, 1, 0]}

['cool', 'lock', 'cook']
c -> 1, 1, 1
o -> 2, 1, 2
o -> 2, 1, 2
l -> 1, 1, 0
['c', 'o']

# Algorithm:
- Initialize an empty hash to hold letter counts (each key will be the char and each value an array of the counts for each letter
- Iterate over all the characters in the first word
  - If the char already exists as a key in the hash, go to the next iteration
  - Assign the current char to be a key in the hash
  - Get the array of counts for that particular char and assign it to be the value
- Initialize an empty array to hold our char results
- Iterate over the letter counts hash
  - If all the elements in the current array value are greater than 0:
    - Add the current letter key to the array the minimum count number of times
- Return the results array of chars

- Get the array of counts for the current char:
  - Initialize an empty array to hold results
  - Iterate over the input array, for each word
    - Get the count of the current char in that word and append it to the results array
  - return the results array
=end

def common_chars(words)
  letter_counts = {}
  words.first.each_char do |char|
    next if letter_counts.has_key?(char)
    letter_counts[char] = get_letter_counts(words, char)
  end
  
  common_letters = []
  letter_counts.each do |letter, counts|
    if counts.all? { |num| num > 0 }
      counts.min.times { common_letters << letter }
    end
  end
  
  common_letters
end

def get_letter_counts(words, char)
  letter_counts = []
  words.each do |word|
    letter_counts << word.count(char)
  end
  
  letter_counts
end


p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['aabbaa', 'cccdddd', 'eeffee', 'ggrrrr']) == []
