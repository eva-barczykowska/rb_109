=begin
Given a non-empty string, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only.

- Input: a string
  - non-empty
  - consisting of at least one char
  - consisting only of lowercase alphabetical characters
- Output: Boolean
  - true if there exists a substring in the input string that can be multiplied to equal the input string
  - false otherwise

Example 1:
 - Input "abab"
 - Output: True
 - Explanation: It's the substring 'ab' twice.

Example 2:
 - Input: "aba"
 - Output: False
 - no substring exists that can be multiplied to equal the given string

Algorithm:
- Generate an array of all possible substrings (1 char up to the length of the string)
- Iterate over the substrings, and select only those substrings of a length that the length of the input string can be divided evenly by
- Iterate over the selected substrings
  - Return true if the current sub can be multiplied to equal the input string
- If we get through everything and no return, return false

- Get substrings:
  - Initialize an empty array to hold substrings
  - Iterate from 0...size of the string, tracking start_i
    - Iterate from start_i...size of the string, tracking end_i
      - Get the slice of the string from start_i to end_i
      - Append this sub to the results array
  - Return the results array

- Select substrings of a length that can be evenly divided by input length
  - Initialize numerator to length of input string
  - Initialize divisor to length of substring
  - Does numerator % divisor equal 0?
  - Exclude any substrings that are equal to the input string

- Can the current sub be multipled to equal the input string?
  - Set a test string to ''
  - Set a counter to 2
  - Iterate a loop
    - Break the loop if the test string is greater than the length of the input string
    - test string = current substring * counter
    - Is the test string equal to the input string?
      - If yes, return true
    - Increment the counter
  - If we break out of the loop without even returning true, return false
=end

def get_all_substrings(string)
  subs = []
  (0...string.size).each do |start_i|
    (start_i...string.size).each do |end_i|
      subs << string[start_i..end_i]
    end
  end
  
  subs
end

def repeated?(substr, input_str)
  test_str = ''
  counter = 2
  loop do
    break if test_str.length > input_str.length
    test_str = substr * counter
    return true if test_str == input_str
    counter += 1
  end
  
  false
end

def repeated_substring(input_str)
  subs = get_all_substrings(input_str).select do |substr|
    input_str.length % substr.length == 0 && substr != input_str
  end
  
  subs.each do |substr|
    return true if repeated?(substr, input_str)
  end
  
  false
end

p repeated_substring('abab') == true
p repeated_substring('aba') == false
p repeated_substring('aabaaba') == false
p repeated_substring('abaababaab') == true
p repeated_substring('abcabcabcabc') == true
p repeated_substring('aaaaa') == true
