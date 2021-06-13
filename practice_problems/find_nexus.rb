=begin
Complete the method that takes a hash/object/directory/association list of users, and find the nexus: the user whose rank is the closest is equal to his honor. Return the rank of this user. For each user, the key is the rank and the value is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes closest. If there are several users who come closest, return the one with the lowest rank (numeric value). The hash will not necessarily contain consecutive rank numbers; return the best match from the ranks provided.

# Goal: given a hash, find the nexus, or the lowest rank number user who has the least difference between rank and honor

- Input: a hash of "users"
  - each key is an integer representing rank
  - each value is an integer representing honor
- Output: an integer representing the key of the nexus user
  - nexus is the user with smallest difference between rank and honor
  - there may be several users with the same difference, in which case return the one with lowest rank

Example
         rank    honor
users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,    <--- nexus
          23  =>  11,
          30  =>   2 }
          
# Algorithm:
- Iterate over the given hash, mapping the honor/rank difference onto the values
- Select only those key value pairs whos difference is equal to the smallest difference
- Sort the remaining keys in ascending numerical order, and return the first one

- Honor/rank difference = absolute value of honor - rank
=end

def difference(rank, honor)
  (honor - rank).abs
end

def nexus(users)
  differences = users.map do |rank, honor|
    [rank, difference(rank, honor)]
  end.to_h
  
  differences.select! do |rank, difference|
    difference == differences.values.min
  end
  
  differences.keys.min
end

p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2
