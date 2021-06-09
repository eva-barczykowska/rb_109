# 5 kyu Simple Pig Latin

# Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.

# Iterate over the words in the given string, and transform each into their pig latin equivalent

# Input: a string containing one or more words
  # Punctuation is not included in the words
# Output: a string containing the pig latin values of the given words
  # Move first letter of the word to the end of the word
  # Add 'ay' to the end of the word
  # Make sure I don't move any punctuation
  # Maintain the case of all characters

# Examples
# pig_it('Pig latin is cool') # igPay atinlay siay oolcay
  # Pig => igP => igPay
  # latin => atinl => atinlay
# pig_it('Hello world !')     # elloHay orldway !

# Algorithm:
  # Split up the input string into an array of words
  # Iterate over the words, transforming as follows
    # Next iteration if punctuation
    # Move first character to the end of the word
    # Append -ay
  # Join with ' ' delimiter and return string result

def pig_it(sentence)
  sentence.split.map do |word|
    if ('a'..'z').cover?(word.downcase)
      word[1..-1] + word[0] + 'ay'
    else
      word
    end
  end.join(' ')
end

p pig_it('Pig latin is cool') == "igPay atinlay siay oolcay"
p pig_it('Hello world !') == "elloHay orldway !"
