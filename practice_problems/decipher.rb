=begin
# Problem:
You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

For each word:

the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)
Note: there are no special characters used, only letters and spaces

- Input: a string in "code"
  - no special characters will be included, on characters and spaces
- Output: a string, the input decoded
  - The first letter of each word is set to it's ASCII code (i.e. a => 97)
  - The second and last letter of each word are switched (Hello => Holle)
  
#Examples

decipherThis('72olle 103doo 100ya'); // 'Hello good day'
72olle -> 72 = H -> Holle switch o & e -> Hello
103doo -> 103 = g -> gdoo switch o & d -> good
100ya -> 100 = d -> dya switch y & d -> day

decipherThis('82yade 115te 103o'); // 'Ready set go'
103o -> 103 = g -> go, note in two letter words second and last char are same so no switch

# Algorithm:
- Convert the input string to an array of words
- Iterate over the words, for each word transform as follows
  - Initialize an empty string to be the first letter
  - Initialize an empty string to be the rest of the word
  - Iterate over the characters in the word
    - If the current char is a number, append it to the first_letter string
    - If the current char is a letter, append it to the rest of the word string
  - Switch the first and last char in the rest of the word string
  - Convert the first_letter string to an integer and get the associated ASCII char
  - Concatenate that with the rest of the word string, have the result be the transformed element
- Join with a ' ' and return the resulting string
=end

def decipher_this(coded_str)
  coded_str.split.map do |word|
    first_letter = ''
    rest_of_word = ''
    word.each_char do |char|
      ('0'..'9').include?(char) ? first_letter << char : rest_of_word << char
    end
    
    rest_of_word[0], rest_of_word[-1] = rest_of_word[-1], rest_of_word[0] unless rest_of_word.empty?
    first_letter.to_i.chr + rest_of_word
  end.join(' ')
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"
