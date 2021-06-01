=begin
# Problem:

Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

Write a method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.

- Input: 2 arguments
  - a hash, in which each key represents a person, and each value is an array representing that person's pocket
  - the pocket array will contain either an empty array, or the elements will be integers
  - second argument, is an array of numbers that are items allowed to exist in a pocket
    - array may be empty
- Output: an array of persons who are "suspects"
  - a suspect is a person (key) from the input hash who has something "forbidden" in their pocket, i.e. anything other than the numbers given as a second argument
  - if empty pockets are required, anyone who has an item in their pocket is suspect
  - If no persons have forbidden items, or the pockets hash is empty, return nil

# Examples:
pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 
find_suspects(pockets, [1, 2]) == [:tom, :jane]
 = > allowed items are 1 and 2.
 - Bob only has 1, which is included in the allowed items, he is not a suspect
 - Tom has 2, which is allwoed, but 5, which is no, so he is a suspect
 - Jane has 7, which is not allowed, so she is a suspect

# Algorithm:

- Initialize an empty array to hold the results
- Iterate over the pocket hash
  - If the current person is a suspect, append them to the results
- Return the results array, unless it is empty, in which case return nil

- Is the current person a suspect?
  - Iterate over the current pocket array
    - Return true if the current value is not included in the allowed values array
- Return false
=end


def suspect?(pocket_contents, allowed_items)
  return false if pocket_contents == nil
  pocket_contents.each do |item|
    return true unless allowed_items.include?(item)
  end
  
  false
end

def find_suspects(pockets, allowed_items)
  return nil unless pockets
  return nil if pockets.values.all? { |pocket| pocket == nil || pocket == []}
  
  suspects = []
  
  pockets.each do |person, items|
    suspects << person if suspect?(items, allowed_items)
  end
  
  return nil if suspects.empty?
  
  suspects
end

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]
