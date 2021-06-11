# Write a method that takes a string and returns a boolean indicating if this string has a balanced set of parentheses.

# Input: a string
# Output: a boolean, true if all open parenthesis in the input string are closed properly, and parenthesis occur in the proper order
  # All open parenthesis must be closed
  # You cannot begin with a closed parenthesis

# Examples
  # '(hi' => false, the open parenthesis is not closed
  # '(hi)' => true, the open parenthesis is matched with a close
  # '(()) hi' => true, all open parenthesis are closed
  # ')(' => false, parenthesis are in the wrong order

# Algorithm:
  # Initialize an empty array
  # Initialize a counter to 0
  # Iterate through the characters in the input string
    # If you hit an open parenthesis, append a false to the array
    # If you hit a closed parenthesis, 
      # Return false if the array is still empty
      # Toggle the boolean at index counter
      # Increment the counter
  # Return whether or not all booleans in the array are true, or if it is empty

def balancer(str)
  parenthesis = []
  index = 0
  
  str.each_char do |char|
    if char == '('
      parenthesis << false
    elsif char == ')'
      return false if parenthesis.empty?
      parenthesis[index] = !parenthesis[index]
      index += 1
    end
  end
  
  parenthesis.all?
end

p balancer("(hi") == false
p balancer("(hi)") == true
p balancer("(()) hi") == true
p balancer(")(") == false
