=begin
Write a method to find the longest common prefix string amongst an array of strings. If there is no common prefix, return an empty string,

All given inputs are in lowercase letters a-z.

# Goal: Given an array of words, find the longest substring that begins all the words in the array.

- Input: an array of string elements
  - all consisting of lowercase alphabetical characters
- Output: a string
  - representing the string of chars that all elements from the input array have in common at the beginning of the string
  - If there are no common prefixes, return an empty string
  
# Examples:
["flower", "flow", "fliwht"]
'flower'
  -> 'f' [0]
  -> 'l' [1]
  -> 'o' [2]
'flow'
  -> 'f' [0]
  -> 'l' [1]
  -> 'o' [2]
'fliwht'
  -> 'f' [0]
  -> 'l' [1]
  -> 'i' [2]
  
# Algorithm:
- Initialize an empty string to hold our results
- Iterate a loop from 0 to the size of the first word, exclusive
  - break the loop if the char at the current index is not the same in all the strings
  - Otherwise, add the char at the current index to the results string
- Return the results string

- Is the char at the current index the same in all the strings?
  - Iterate over the array of strings
    - return false if the char at the current index is ever not equal to the current char
  - Otherwise, return true
=end

def common_char?(words, index)
  current_char = words[0][index]
  words.each do |word|
    return false unless word[index] == current_char
  end
  
  true
end

def common_prefix(words)
  prefix = ''
  
  (0...words[0].size).each do |index|
    break unless common_char?(words, index)
    prefix << words[0][index]
  end
  
  prefix
end

puts common_prefix(["flower", "flow", "fliwht"]) == "fl"
puts common_prefix(["dog", "racecar", "car"]) == ""
puts common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
puts common_prefix(["throne", "dungeon"]) == ""
puts common_prefix(["throne", "throne"]) == "throne"
