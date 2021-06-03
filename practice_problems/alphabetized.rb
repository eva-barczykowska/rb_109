=begin
# Problem:
The alphabetized kata
Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the english alphabet letters.

Example:

alphabetized("The Holy Bible") # "BbeehHilloTy"

- Input: a string
  - may be empty
  - containing only alphabetical characters and whitespace
- Output: a string, containing the characters from the input string in alphabetical order
  - alphabetical order should be case insensitive
  - remove all punctuation and whitespace

# Algorithm:
- Convert the string to an array of characters
- Select only those characters that are not whitespace or punctuation (letters)
- Sort the array by alphabetical order (case insensitive)
- Join and return the sorted array
=end

def alphabetized(str)
  letters = str.chars.select { |char| ('a'..'z').include?(char.downcase) }
  letters.sort_by { |char| char.downcase}.join
end

p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
