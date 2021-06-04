=begin
5kyu

How can you tell an extrovert from an introvert at NSA? Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.

I found this joke on USENET, but the punchline is scrambled. Maybe you can decipher it? According to Wikipedia, ROT13 (http://en.wikipedia.org/wiki/ROT13) is frequently used to obfuscate jokes on USENET.

Hint: For this task you're only supposed to substitue characters. Not spaces, punctuation, numbers etc. Test examples:

rot13("EBG13 rknzcyr.") == "ROT13 example.";
rot13("This is my first ROT13 excercise!" == "Guvf vf zl svefg EBG13 rkprepvfr!"

Rot 13 means each letter is replaced by the letter appearing 13 places in the alphabt. after the original letter. Last 13 letters alphabet you start over.

- Input: a scrambled string
- Output: a string with the scrambled input message decoded
  - Maintain case of the original string
  - Maintain any punctuation in the original string
  - Maintain any numerical characters in the original string
  - The scrambled letter is 13 places prior to the unscrambled letter
  - If we reach the end of the alphabet ('z'), the next char is ciricled around to the beginning ('a')
  - A - Z 65 - 90
  - a - z 97 - 122
  
# Example:
"Abc"
A -> 65, 65 + 13 = 78 -> 'N'
b -> 98, 98 + 13 = 111 -> o
c -> 99, 99 + 13 = 112 -> p
Nop

# Algorithm:
- Convert the input string into an array of chars
- Iterate over each char in the array transforming as follows
  - If the current char is a uppercase letter:
    - Convert to ASCII code 
    - Add 13 to the ASCII code
    - If this is greater than 90
      - subtract 91 from value
      - Add that difference to the beginning letter of the ASCII values (65)
    - Return the char associated with the integer result
  - If the current char is a lowercase letter:
    - Convert to ASCII code
    - Add 13 to ASCII code
    - If the is greater than 122
      - subtract 123 from the value
      - Add that difference to the beginning letter of the alphabet (97)
    - Return the char associated with the integer result
  - If the current char is not a letter
    - Return that character
- Join and return the resulting string
=end

def rot_upper(char)
  value = char.ord
  value += 13
  if value > 90
    value -= 91
    value += 65
  end
  
  value.chr
end

def rot_lower(char)
  value = char.ord
  value += 13
  if value > 122
    value -= 123
    value += 97
  end
  
  value.chr
end


def rot13(string)
  string.chars.map do |char|
    if ('A'..'Z').include?(char)
      rot_upper(char)
    elsif ('a'..'z').include?(char)
      rot_lower(char)
    else
      char
    end
  end.join
end

p rot13("Abc") == "Nop"
p rot13("xYz") == "kLm"
p rot13("EBG13 rknzcyr.") == "ROT13 example."
p rot13("This is my first ROT13 excercise!") == "Guvf vf zl svefg EBG13 rkprepvfr!"
