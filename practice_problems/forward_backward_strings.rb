=begin
# Problem:
You need to play around with the provided string (s).

Move consonants forward 9 places through the alphabet. If they pass 'z', start 
again at 'a'. Move vowels back 5 places through the alphabet. If they pass 'a', 
start again at 'z'.  Provided string will always be lower case, won't be empty 
  and will have no special characters.

- Input: a string, with at least one alphabetical character
  - all lowercase
  - all alphabetical characters
- Output: a string
  - vowels from input are moved backward 5 places in alpahabet
  - consonants are moved forward 9 places
  - if you get to 'z' start again at 'a'

# Examples
'testcase'
't' -> 'c' forwards 9 116 -> 99
'e' -> 'z' backwards 5 101 -> 122

# Algorithm:
- Initialize constants that describe vowels and consonants
- Break the string up into an array of characters
- Iterate over each character, transforming it 
  - If the character is a vowel
    - Subtract 5 from it's ASCII value and get the resulting char
    - Create a loop that iterates 9 times,
      - subtract 1 from the ASCII value
      - If the ASCII value is less than 97, go back to 122
      - If the ASCII value is greater than 122, go back to 97
  - If the character is a consonant
    - Add 9 to it's ASCII value and get the resulting char
      - If the value is less than 97 go back to 122
      - If the value is greater than 122, go back to 97
- Join and return the resulting string
=end

VOWELS = 'aeiou'

def vowel_back(string)
  string.chars.map do |char|
    if VOWELS.include?(char)
      go_back_5(char)
    else
      go_forward_9(char)
    end
  end.join
end

def go_back_5(char)
  value = char.ord
  5.times do 
    value = value - 1
    if value < 97
      value = 122
    elsif value > 122
      value = 97
    else
      value
    end
  end
  
  value.chr
end

def go_forward_9(char)
  value = char.ord
  9.times do
    value = value + 1
    if value < 97
      value = 122
    elsif value > 122
      value = 97
    else
      value
    end
  end
  
  value.chr
end


p vowel_back("testcase") == "czbclvbz"
p vowel_back("codewars") == "ljmzfvab" 
p vowel_back("exampletesthere") == "zgvvyuzczbcqzaz"
p vowel_back("returnofthespacecamel") == "azcpawjocqzbyvlzlvvzu"
p vowel_back("bringonthebootcamp") == "kadwpjwcqzkjjclvvy"
p vowel_back("weneedanofficedog") == "fzwzzmvwjoodlzmjp"
