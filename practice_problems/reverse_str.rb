=begin
take a string as an argument, return the string in reverse order without using the built-in reverse method.

- Input: a string
  - may contain only whitespace
- Output: the same string with all characters in reverse order

# Examples:
reverse_string("abcde") == "edcba"
  - abcde 
  - ebcda 0 -1
  - edcba 1 -2
reverse_string(" ") == " "
reverse_string("football") == "llabtoof"
  - football 
  - lootbalf 0 -1
  - llotbaof 1 -2
  - llatboof 2 -3
  - llabtoof 3 -4

# Algorithm:
 - Initialize a counter to -1
 - Iterate a loop, tracking index (iterations) from 0 to size of string / 2 - 1
   - Switch the current index with the counter
   - Decrement the counter
- Return the string
=end

def reverse_string(string)
  right_idx = -1
  0.upto((string.size / 2) - 1) do |left_idx|
    string[right_idx], string[left_idx] = string[left_idx], string[right_idx]
    right_idx -= 1
  end
  
  string
end

p reverse_string("abcde") == "edcba"
p reverse_string(" ") == " "
p reverse_string("football") == "llabtoof"
