=begin
Mothers arranged a dance party for the children in school. At that party, there are only mothers and their children. All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night and no one can see each other. But you were flying nearby and you can see in the dark and have ability to teleport people anywhere you want.

Legend:
-Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
-Function input: String contains only letters, uppercase letters are unique.
Task:
Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".

- Input: a string
  - containing only alphabetical letters, both upper and lowercase
  - uppercase letters will be unique and represent "mothers"
  - lowercase letters can be multiple and represent "children"
- Output: a string that pairs mothers with children
  - Place all letters from the input string in case insensitive alphabetical order
  - The uppercase letter should come before the lowercase children letters
  - an empty string returns an empty string

# Examples:
'abBA' => 'AaBb'

# Algorithm:
- Initialize an empty string to hold the results
- Convert the input string into two arrays, mothers (uppercase) and children (lowercase)
- Sort alphabetically each array
- Iterate over the mothers (uppercase) array
  - Add the current element to the results string
  - Iterate over the children array
    - If an element matches the current mothers element lowercase, append it to the results string
- Return the results string
=end

def find_children(jumbled_str)
  ordered_str = ''
  mothers, children = jumbled_str.chars.partition { |char| ('A'..'Z').include?(char) }
  mothers, children = mothers.sort, children.sort
  
  mothers.each do |mother|
    ordered_str << mother
    children.each do |child|
      ordered_str << child if child == mother.downcase
    end
  end
  
  ordered_str
end

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""
