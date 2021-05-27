=begin
Count letters in string
In this kata, you've to count lowercase letters in a given string and return 
the letter count in a hash with 'letter' as key and count as 'value'. The key 
must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

# Problem:
- Input: a string
  - will always be at least one word and consist of alphabetical characters
- Output: a hash consisting of the count for each letter
  - the key should be the letter as a symbol
  - the count should be an integer


Example:

letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, 
                                :m=>1, :r=>1, :s=>1, :t=>2}

# Algorithm:
- Initialize an empty hash
- Convert the string to an array of chars
- Iterate over the chars
  - If the char as a symbol does not exist as a key in the hash
    - Add the symbol as a key and set the value to 1
  - If it does exist
    - Increment the value by 1
=end

def letter_count(string)
  counts = {}
  string.each_char do |char|
    if counts.has_key?(char.to_sym)
      counts[char.to_sym] += 1
    else
      counts[char.to_sym] = 1
    end
  end

  counts
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
