=begin
# Problem:
The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

- Input: a string, containing any type of character
- Output: a string consisting of either '(' or ')'
  - based on the value of the input string
  - put '(' in the place of any character that appears once in the original string
  - put ')' in the place of any character than appears mroe than once in the original string
  - character quantity should not be case sensitive (i.e. tT = )))

# Examples
"din"      =>  "((("
"recede"   =>  "()()()"
"Success"  =>  ")())())"
"(( @"     =>  "))((" 

# Algorithm:
- Create a version of the input string that is all lowercase
- Convert that to an array of characters
- Iterate over the array of characters, transforming
  - if the current char appears in the input string once, '('
  - if the current char appears in the input string more than once, ')'
- Join and return the resulting string
=end

def duplicate_encode(string)
  string = string.downcase
  string.chars.map do |char|
    string.count(char) > 1 ? ')' : '('
  end.join
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("
