=begin
Write a function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise, return false.

# Goal: given two string arguments, check to see if some set of characters in the first argument are an anagram of the second argument.

- Input: two string arguments
  - consisting only of lower case alphabetical letters
  - will always have at least one letter
- Output: boolean
  - true of some subset of the chars in string1 are an anagram of string2
  - false otherwise

# Examples:
'javaass', 'jjss'
  - 'j' => 1, => 2 st1 is less than str2 so return false
  - 'a' => 3, => 0
  - 'v' => 1, => 0
  - 's' => 2, => 2
'rkqodlw', 'world
  - 'r' => 1, => 1
  = 'k' => 1, => 0
  - 'q' => 1, => 0
  - 'o' => 1, => 1
  - 'd' => l, => 1
  - 'l' => 1, => 1
  - 'w' => 1, => 1
  all letters in str2 have a count that is <= to counts in str1, return true

# Algorithm:
- Iterate over the characters in str2
  - If the count of the current char in str1 is ever less than the current count
  - Return false
- If we get through the whole iteration, return true
=end

def scramble(str1, str2)
  str2.each_char do |char|
    return false if str1.count(char) < str2.count(char)
  end
  
  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
