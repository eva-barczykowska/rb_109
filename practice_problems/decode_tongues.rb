=begin
Gandalf's writings have long been available for study, but no one has yet figured out what language they are written in. Recently, due to programming work by a hacker known only by the code name ROT13, it has been discovered that Gandalf used nothing but a simple letter substitution scheme, and further, that it is its own inverse|the same operation scrambles the message as unscrambles it.

This operation is performed by replacing vowels in the sequence 'a' 'i' 'y' 'e' 'o' 'u' with the vowel three advanced, cyclicly, while preserving case (i.e., lower or upper).

Similarly, consonants are replaced from the sequence 'b' 'k' 'x' 'z' 'n' 'h' 'd' 'c' 'w' 'g' 'p' 'v' 'j' 'q' 't' 's' 'r' 'l' 'm' 'f' by advancing ten letters.

So for instance the phrase 'One ring to rule them all.' translates to 'Ita dotf ni dyca nsaw ecc.'

The fascinating thing about this transformation is that the resulting language yields pronounceable words. For this problem, you will write code to translate Gandalf's manuscripts into plain text.

Your job is to write a function that decodes Gandalf's writings.

Input
The function will be passed a string for the function to decode. Each string will contain up to 100 characters, representing some text written by Gandalf. All characters will be plain ASCII, in the range space (32) to tilde (126).

Output
For each string passed to the decode function return its translation.

# Goal: to take a string representing a sentence or phrase in Galdalfs code, and decode it into plain English

- Input: a string consisting of at least one word
  - Alphabetical characters, whitespace, and punctuation only
- Output: a string representing the decoded input string
  - Maintain case of original string
  - Maintain punctuation of original string

# Examples:
'Ita dotf ni dyca nsaw ecc.'
  => Vowel: move it three backwards in the given sequence ['a' 'i' 'y' 'e' 'o' 'u']
  => Consonents: move it backwards ten in the given sequence ['b' 'k' 'x' 'z' 'n' 'h' 'd' 'c' 'w' 'g' 'p' 'v' 'j' 'q' 't' 's' 'r' 'l' 'm' 'f']
  
  'i' = 1
  1 - 3 => -2
  

# Algorithm:
- Initialize vowels and consonent sequences as a constant
- Initialize an empty string to hold our decoded results
- Iterate over each character in the input string
  - If it is a lowercase letter (a-z)
    - Find it's decoded equivalent, append it to the results string
  - If it is an uppercase letter
    - Find it's decoded equivalent, and append it uppercased to the results string
  - If it's its not a letter, just append the current char to the results string
- Return the results string

- Find letter's decoded equivalent: (takes a lowercase letter)
  - If it is a vowel:
    - Get the index number of the current character in the vowels array
    - Subtract three from that index number
    - Return the character at that new index in the vowels array
  - If it is a consonent:
    - Get the index number of the current character in the consonants array
    - Subtract 10 from that index
    - Return the character at the new index in the consonants array
=end

VOWELS = 'aiyeou'
CONSONANTS = 'bkxznhdcwgpvjqtsrlmf'

def find_letter(char)
  if VOWELS.include?(char)
    index = VOWELS.index(char) - 3
    VOWELS[index]
  elsif CONSONANTS.include?(char)
    index = CONSONANTS.index(char) - 10
    CONSONANTS[index]
  end
end

def tongues(coded_phrase)
  decoded_phrase = ''
  coded_phrase.each_char do |char|
    if ('a'..'z').include?(char)
      decoded_phrase << find_letter(char)
    elsif ('A'..'Z').include?(char)
      decoded_phrase << find_letter(char.downcase).upcase
    else
      decoded_phrase << char
    end
  end
  
  decoded_phrase
end


p tongues('Ita dotf ni dyca nsaw ecc.') == 'One ring to rule them all.'
p tongues('Tim oh nsa nowa gid ecc fiir wat ni liwa ni nsa eor ig nsaod liytndu.') == 'Now is the time for all good men to come to the aid of their country.'
p tongues('Giydhlida etr hakat uaedh efi iyd gidagensadh pdiyfsn ytni nsoh') == 'Fourscore and seven years ago our forefathers brought unto this'
p tongues('litnotatn e tam tenoit.') == 'continent a new nation.'
p tongues('Nsa zyolv pdimt gij xywbar ikad nsa cequ rifh.') == 'The quick brown fox jumped over the lazy dogs.'
