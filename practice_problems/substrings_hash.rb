=begin
Given a certain string, create a hash with each character in string as key and
all possible substrings in string starting at each character as value.

# Problem:
- Input: a string
- Output: a hash
  - Each key in the hash represents one character from the string
  - Each value in the hash represents all possible substrings beginning with 
    the associated character
  - One character substring is valid

# Examples:
-'abcd'
key1 == index 0
  - 'a' [0, 1]
  - 'ab'[0, 2]
  - 'abc'[0, 3]
  -'abcd' [0, 4] 
  - starting at the current index moving up the length of this particular
    substring
key2 = index 1
  - 'b' [1, 1]
  - 'bc' [1, 2]
  - 'bcd' [1, 3]
...etc

# Algorithm
- Initialize my substrings hash with a default value of an empty array
- Initialize a loop that iterates over all the characters in the input string, 
  tracking index 0-size -1
  - Initialize a key in the hash that contains the character in the string at
    the current index
  - Take the substring that starts at the current index - end of the input string
  - Iterate another loop that tracks substring length from 1 - size of current 
    substring
    - Take the substring that starts at the current index and goes up to the
      current length
    - Append it to the array of the associated characters key
- Return the hash
=end

def consecutive_runs(string)
  substrings = Hash.new([])
  
  (0...string.size).each do |index|
    outer_substring = string[index..-1]
    1.upto(outer_substring.length) do |length|
      substrings[string[index]] += [outer_substring[0, length]]
    end
  end
  
  substrings
end

p consecutive_runs('abcd') == {"a"=>["a", "ab", "abc", "abcd"], 
                               "b"=>["b", "bc", "bcd"], 
                               "c"=>["c", "cd"], 
                               "d"=>["d"]}
