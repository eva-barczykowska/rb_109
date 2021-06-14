=begin
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

#Example 1: a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

#Example 2: a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []

Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.

In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.

Beware: r must be without duplicates.
Don't mutate the inputs.

- Input: two arrays of strings
  - consisting only of lowercase alphabetical letters
- Output: an array of strings
  - each element represents a substring of one of the string elements in the first array argument given
  - each element should be from the second array element
  - the elements should be listed in alphabetical order
  - If there are no such elements in the second array argument, return an empty array
  - Do not modify the inputs
  
# Algorithm:
  - Initialize an empty array to hold our results
  - Iterate through the first array argument (potential substrings)
    - If the current element is included in any of the strings from the second array argument, append it to the results array
  - Sort the results array alphabetically, and return it
=end

def in_array(arr1, arr2)
  results = []
  
  arr1.each do |pot_sub|
    if arr2.any? { |str| str.include?(pot_sub) }
      results << pot_sub
    end
  end
  
  results.uniq.sort
end

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

p in_array(a1, a2) == ["arp", "live", "strong"]

a1 = ["tarp", "mice", "bull"]

p in_array(a1, a2) == []
