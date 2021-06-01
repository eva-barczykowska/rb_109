=begin
# Problem:

In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
Rules
  1.  The input string will always be lower case but maybe empty.
  2.  If the character in the string is whitespace then pass over it as if it was an empty seat.

- Input: a string
  - may be empty, or containing one or more words
  - always lowercase
- Output: an array of strings with the same value
  - Each string has one uppercase letter, starting from index 0 moving to the end of the string
  - Skip over whitespace characters

# Examples:
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

# Algorithm:

- Initialize an empty array to hold the results
- Iterate over each character in the input string, with index
  - Go to the next iteration if the current character is whitespace
  - Make a copy of the string
  - Capitalize the letter at the current index
  - Append this to the results array
- Return the results array
=end

def wave(string)
  wave_words = []
  
  string.chars.each_with_index do |char, index|
    next if char == ' ' 
    
    current_word = string.dup
    current_word = current_word[0...index] + current_word[index].upcase + current_word[(index + 1)..-1]
    wave_words << current_word
  end
  
  wave_words
end


p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
