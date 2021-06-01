=begin
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the 
alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the 
original string.

All letters will be lowercase and all inputs will be valid.

# Problem:
- Input: a string containing one or more words
  - word = a series of letter chars seperated by spaces
  - string will always consist of alphabetical chars and whitespace, 
  no numbers/punctuation
  - all letters will be lowercase
- Output: a string, the word that has the highest "score"
  - score is determined by the letters in the word
  - each letter is assigned n number of points, where n is it's position 
  in the alphabet
    (i.e. a => 1, b => 2, etc)
  - if two words have the same score, return the word that appears earliest 
    in the original string

# Examples:
- 'aaa b' => aaa = 3, b = 2, therefore we return 'aaa'

# Algoithm:
- Initialize an alphabet string containing all the leters in the alphabet 
in order
- Initialize an empty hash
- Split the sentence into an array of words
- Iterate over each word in the array
  - Get the score for the current word
  - Add the current word as the key and it's score as the associated value 
  in the hash
- Select those key-value pairs in the hash that have the maximum score
- Return the key that appears first in the hash of selected items

- Get the score for the current word
  - Initialize a score variable to 0
  - Iterate over the chars in the word, for each char
    - Add the score value for the current char to the score variable
  - Return the score
=end

ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

def word_score(word)
  score = 0
  word.each_char { |char| score += (ALPHABET.index(char) + 1) }
  score
end

def high(sentence)
  scores = {}
  sentence.split.each do |word|
    scores[word] = word_score(word)
  end
  
  scores.select! { |word, score| score == scores.values.max }
  
  scores.keys.first
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'
