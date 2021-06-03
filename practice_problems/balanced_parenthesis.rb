# Write a method that takes a string and returns a boolean indicating if this string has a balanced set of parentheses.

# Input: string
# Output: boolean (true or false)

# Rule:
  # 

# Data Structure:
  # string
  # array of chars
  # boolean


# p balancer("(hi") == false
    # count == 1 => false
# p balancer("(hi)") == true
    # count == 2 => true
# p balancer("(()) hi") == true
    # count == 2 => true
# p balancer(")(") == false
    # count == 2 => false

# Algorithm:
  # convert input string into an array of chars
  # iterate through those chars
  # select chars that are == to "(" ")"
  # if count of new array is even && if starts_with?("(") && ends_with?(")")
      # new_arr[0] == "(" && new_arr[-1] == ")"
    # return true
  # else return false

# Algorithm:
  # convert input string into an array of chars
  # iterate through those chars
  # select chars that are == to "(" ")"
  # initialize a boolean variable balanced to true
  # iterate through the array of ()
    # if ( set to false
    # if ) set back to true
    
    # booleans = []
    # p balancer("(hi") == false
      # if char = "("
        # booleans << false
      # end
    # p balancer("(hi)") == true
        # if char = "("
          # booleans << false
        # elsif char = ")"
          # booleans << true

    # grab last element in the array
      
    # p balancer("(()) hi") == true
    # p balancer(")(") == false
    # p balancer("((") == false
    # p balancer("()))") == false

    def balancer(str)
      balanced = true
      
      booleans = []
      new_arr = str.chars.each do |char|
        if char == "(" 
          booleans << false
        elsif char == ")"
          booleans << true
        end
      end
      
      return false if booleans.count(false).odd? && booleans.count(false) > 1
      return false if booleans.count(true).odd? && booleans.count(true) > 1
      
      booleans[-1]
    end
    
    p balancer("(hi") == false
    p balancer("(hi)") == true
    p balancer("(()) hi") == true
    p balancer(")(") == false
    p balancer("((") == false
    p balancer("()))") == false