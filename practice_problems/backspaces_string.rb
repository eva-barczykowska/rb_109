=begin
# Problem:

Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.

- Input: a string, containing some characters or empty
  - '#' represents a backspace
- Output: a string with all # backspaces from input string procesed
  - # takes out itself and the char at index - 1
  - if input string is empty, return empty string
  - if more backspaces than other chars, return empty string

# Examples: 

"abc#d##c"      ==>  "ac"
-a-----c
"abc##d######"  ==>  ""

"#######"       ==>  ""
""              ==>  ""

# Algorithm:
- Initialize an empty string to hold the result
- Iterate over each char in input string with index
  - Append the current char to the result string unless it is #
  - If it is a #
    - chop the last char in the result string off
- Return the result string
=end

def clean_string(string)
  result_str = ''
  string.each_char do |char|
    char == '#' ? result_str.chop! : result_str << char
  end
  
  result_str
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""
