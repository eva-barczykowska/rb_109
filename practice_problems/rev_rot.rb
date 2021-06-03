=begin
Reverse or rotate?
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.

If:
sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".

- Input: a string of numerical characters and an integer sz representing desires substring size
- Output: the same string with each substring of size sz either rotated or reversed
  - Reverse the substring if the cubes of its digits is divisible by 2
  - Rotate the substring one position to the left otherwise
    i.e. shift first digit in substring to be last digit in substring
  - if input string is empty return empty string
  - if size is 0 or negative return an empty string
  - if size is greater than the length of the string, return an empty string
  
# Examples:
revrot("123456987654", 6) --> "234561876549"
  123456 -> 1**3 + 2**3 + 3**3 + 4**3 + 5**3 + 6**3 = 441, rotated substring => 234561
  987654 -> 9**3 + 8**3 + 7**3 + 6**3 + 5**3 + 4**3 = 1989, rotated substring => 876549
revrot("123456987653", 6) --> "234561356789"
  987653 -> 9**3 + 8**3 + 7**3 + 6**3 + 5**3 + 3**3 = 1952, reverse substring => 356789
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> "" 
revrot("563000655734469485", 4) --> "0365065073456944"

# Algorithm:
- Generate all the substrings of size sz
  - Initialize an empty array to hold all subs
  - Convert the string to an array of chars
  - Iterate a loop from 0 to the size of the array, tracking iteration, step by sz
    - Get the slice of the array that starts at current i with legnth sz
    - Add it to the results array
  - Return the results array
- Iterate over all the subs, for each sub transform as follows
  - Initialize a sum to 0
  - Iterate over the characters in the sub, for each char
    - Convert the char to an integer
    - Get the cube of that integer
    - Add it to the sum
  - If the sum is evenly divisible by 2
    - Reverse the sub
  - Otherwise
    - Rotate the first and last elements of the sub
- Flatten and join the transformed array, return the result
=end

def reverse?(arr)
  sum = 0
  arr.each do |char|
    sum += char.to_i**3
  end
  
  sum.even?
end

def get_subs(str, sz)
  subs = []
  digits = str.chars
  
  0.step(by: sz, to: digits.size - 1) do |i|
    subs << digits[i, sz]
  end
  
  subs.select { |sub| sub.size == sz }
end

def revrot(num_str, sz)
  return '' if sz <= 0 || num_str.empty? || sz > num_str.size
  get_subs(num_str, sz).map do |sub|
    if reverse?(sub)
      sub.reverse
    else
      first = sub.shift
      sub << first
      sub
    end
  end.flatten.join
end

p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"
