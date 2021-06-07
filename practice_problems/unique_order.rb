# Implement the function unique_in_order which takes as argument a sequence and returns a list of items without any elements with the same value next to each other and preserving the original order of elements.

# Inout: some kind of sequence
  # a string of characters
  # an array of elements (integers)
# Outputting: an array of the given sequence, where each element represents a single item from the original sequene where the item before and the item after it are not equal to it
  # Letters are case sensitive ('C' != 'c')

# For example:
  # ''AAAABBBCCDAABBB'
  # ['A', 'B', 'C', 'D', 'A', 'B']

# Algorithm:
  # Initialize an empty array to hold my results
  # Initialize current sequence item to nil
  # Iterate over the input sequence, for each item
    # is the current item equal to the current sequence item?
      # go to the next iteration
    # Otherwise
      # Add the current item to the results array
      # Reassign the current item to the current sequence item
  # Return my results array

  def unique_in_order(sequence)
    results = []
    current_sequence_item = nil
    sequence = sequence.chars if sequence.class == String
    
    sequence.each do |item|
      next if item == current_sequence_item
      results << item
      current_sequence_item = item
    end
    
    results
  end
      
  
  p unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
  p unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
  p unique_in_order([1,2,2,3,3])       == [1,2,3]
  