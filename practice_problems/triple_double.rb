=begin
Write a function

triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0

Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

- Input: two integers
  - postive non-zero integers
- Output: an integer 1 or 0
  - 1 if the first integer argument has a digit that is repeated three times contiguously AND the second integer argument has a digit that is repeated two times contiguously
  - both repeated digits must be the same number
  - 0 otherwise
  
# Algorithm:
  - Convert each number to a string of digits
  - Generate an array of substrings of num1, each substring should be 3 chars long
  - Generate an array of substrings of num2, each substring should be 2 chars long
  - Iterate over the substrings in num1, selecting any that consist of the same digit
  - Iterate over the substrings in num2, selecting any that consist of the same digit
  - Compare the elements in each array of subs - are the remaining subs consisting of the same digit?
  - If both of the above are true, return 1, otherwise, return 0
  
  - Generate an array of substrings of length n
    - Initialize an array to hold our results
    - Iterate a loop from 0 to the length of the string - n, tracking i
      - Get the slice of the string that starts at i and is length n, append it to the results array
    - Return the results array
  
  - Are all digits in the string the same?
    - convert the string to an array of chars
    - Do all of the chars equal the first string? (true if yes, false if no)
=end

def get_subs(str, length)
  subs = []
  (0..str.size - length).each do |i|
    subs << str[i, length]
  end
  
  subs
end

def straight_run?(str)
  str.chars.all? { |char| char == str[0] }
end

def triple_double(num1, num2)
  subs1 = get_subs(num1.to_s, 3)
  subs2 = get_subs(num2.to_s, 2)
  
  subs1.select! { |sub| straight_run?(sub) }
  subs2.select! { |sub| straight_run?(sub) }
  
  return 0 if subs1.empty? || subs2.empty?
  
  subs2.each do |sub2|
    subs1.each do |sub1|
      return 1 if sub1[0] == sub2[0]
    end
  end
    
  0
end

p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(1112, 122) == 0
p triple_double(451999277, 41177722899) == 1
