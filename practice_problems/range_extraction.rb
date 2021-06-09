# 4 kyu Range Extraction

# A format for expressing an ordered list of integers is to use a comma separated list of either
# individual integers or a range of integers denoted by the starting integer separated from the end integer in the range by a dash, '-'. 
  # 1, 2, 3, 4 or 1-4

# The range includes all integers in the interval including both endpoints. It is not considered a range unless it spans at least 3 numbers. For example "12,13,15-17"

# Complete the solution so that it takes a list of integers in increasing order and returns a correctly formatted string in the range format.

# Input: an array of integers
  # integers can have a step of any amont (i.e. 1, 3, 4, 5, 9)
  # integer can be positive or negative
# Output: a string of the list of integers in proper range format
  # if three or more consecutive integers are next to each other on a number line (i.e. 1, 2, 3, 4), they should be denoted as a range (1-4)
  # otherwise, seperate all integers with a comma (i.e. 1, 3, 5)

# Example:

# solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20])
# # returns "-6,-3-1,3-5,7-11,14,15,17-20"
  # -3 - -6 => 3
  # -2 - -3 => 1
  # -1 - -2 => 1
  # 0 - -1 => 1
  # 1 - 0 => 1
  #   # => include the elements with a difference of 1 in the range
  # 3 - 1 => 2
  # 4 -3 => 1
  # 5 -4 => 1
  #   # => include difference of 1 in the range
  # 8 - 7 => 1
  # 9 - 8 => 1
  # 10 - 9 => 1
  # 11 - 10 => 1
  #   # => in the range
  # 14 - 11 => 3
  # ...etc

# Algorithm:
  # Initialize an empty array to hold my results
  # Initialize a current range = ''
  # Iterate over the array of integers with index
    # Subtract the element at current index from element at index + 1
    # If the difference is not 1
      # Add that element to the results array
      # As a string with a ',' appended
    # Otherwise
      # Is the element at index 0 or does ele[i] - ele[i - 1] != 1
        # This is the first number in the range:
          # append the current element as a string to the current_range variable with '-'
      # if element[i] - ele[i-1] == 1 && ele[i + 1] - ele[i] == 1
          # this number is in the middle of the range, go to the next iteration
      # otherwise if element [i + 1] - ele[i] != 1
          # It's the end of the range, so add the number to the current_range variable as a string
          # append the current_range to the array
          # re-set the current_range to ''

def solution(numbers)
  results = []
  current_range = ''
  
  numbers.each_with_index do |num, idx|
    if index == 0 || (numbers[idx + 1] - num != 1 && num - numbers[idx - 1] != 1)
      results << num.to_s
    else
      
    end
      
  end
end


p solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) == '-6, -3-1, 3-5, 7-11, 14, 15, 17-20"