=begin
Given 2 strings, your job is to find out if there is a substring that appears in both strings. You will return true if you find a substring that appears in both strings, and false if not. A substring is longer than 1 character.

# Problem:
- Input: 2 strings
  - May be an empty string
- Output: a boolean
  - true if there is a substring that appears in both input strings
  - false if there is no common substrings
  - substrings consists of at least 2 characters
  - common substrings are case insensitive

# Examples: 
- Ex1: 'Something', 'Fun'
  - ['so', 'om', 'me', 'et', 'th', 'hi', 'in', 'ng', 'fu', 'un']
    [ str1[0, 2], str2[1, 2], str2[2, 2] ...etc... str2[0,2], str2[1,2]...etc ]
  - Here each substring occurs only once so return false
- Ex2: 'Something', 'Home'
  - ['so', 'om', 'me', 'et', 'th', 'hi', 'in', 'ng', 'ho', 'om', 'me']
  - [ str1[0, 2], str2[1, 2], str2[2, 2] ...etc... str2[0,2], str2[1,2]...etc ]
  - 'om' and 'me' both occur twice so return true
- Ex3: if one input string is an empty string, return false
  - an empty substring is not a valid substring
- Ex4: 'BANANA', 'banana' returns true
  - if one substring is uppercase and one substring is lowercase they still match
  - substrings are not case sensitive
- Ex5: 'test', 'llt' returns false
  - a one character substring ('t') is not a valid substring
- Ex6: '', '' return false
  - empty strings return false (empty substring is invalid)
- Ex7: '1234567', '541265' returns true
  - numeric strings are valid as long as they are at least 2 chars long

# Algorithm:
- Generate an array of all substrings that are 2 chars long from both input strings
  - Initialize a substrings array to []
  - Append a list of all 2 characters substrings in str1
  - Append a list of all 2 character substrings in str2
- Iterate over the array of substrings
  - return true if the count of the current substring in the array is greater than 1
- return false

- Get all 2 character substrings in a string
  - Initialize a substrings array to []
  - Iterate from 0 to 2 less than the length of the string (only go up to penultimate character)
  - Track index throughout
    - Append the section of the input string starting at the current index that is 2 characters long
=end

def n_length_substrings(string, length)
  substrings = []
  (0..(string.size - 2)).each do |index|
    substrings << string[index, length].downcase
  end
  substrings
end

def substring_test(str1, str2)
  substrings = []
  substrings += n_length_substrings(str1, 2)
  substrings += n_length_substrings(str2, 2)
  
  substrings.each do |substring|
    return true if substrings.count(substring) > 1
  end
  
  false
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
puts substring_test('Something', '') == false
puts substring_test('BANANA', 'banana') == true
puts substring_test('test', 'llt') == false
puts substring_test('', '') == false
puts substring_test('1234567', '541265') == true
