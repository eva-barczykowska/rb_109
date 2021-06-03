=begin
John and Mary want to travel between a few towns A, B, C ... Mary has on a sheet of paper a list of distances between these towns. ls = [50, 55, 57, 58, 60]. John is tired of driving and he says to Mary that he doesn't want to drive more than t = 174 miles and he will visit only 3 towns.

Which distances, hence which towns, they will choose so that the sum of the distances is the biggest possible to please Mary and John?

Example:
With list ls and 3 towns to visit they can make a choice between: [50,55,57],[50,55,58],[50,55,60],[50,57,58],[50,57,60],[50,58,60],[55,57,58],[55,57,60],[55,58,60],[57,58,60].

The sums of distances are then: 162, 163, 165, 165, 167, 168, 170, 172, 173, 175.

The biggest possible sum taking a limit of 174 into account is then 173 and the distances of the 3 corresponding towns is [55, 58, 60].

The function chooseBestSum (or choose_best_sum or ... depending on the language) will take as parameters t (maximum sum of distances, integer >= 0), k (number of towns to visit, k >= 1) and ls (list of distances, all distances are positive or zero integers and this list has at least one element). The function returns the "best" sum ie the biggest possible sum of k distances less than or equal to the given limit t, if that sum exists, or otherwise nil, null, None, Nothing, depending on the language.

With C++, C, Rust, Swift, Go, Kotlin, Dart return -1.

Examples:
ts = [50, 55, 56, 57, 58] choose_best_sum(163, 3, ts) -> 163

xs = [50] choose_best_sum(163, 3, xs) -> nil (or null or ... or -1 (C++, C, Rust, Swift, Go)

ys = [91, 74, 73, 85, 73, 81, 87] choose_best_sum(230, 3, ys) -> 228

Note:
don't modify the input list ls
=end

=begin
# Problem
  - Input:
    - an integer, t, the longest amount of miles John wants to drive
    - an integer, k, the amount of towns John will visit
    - an array, ls, of integers representing distances between towns
  - Output: an integer, representing the largest possible distance less than k that traverses k amount og towns
    - If no such combination is possible, return nil

# Example
if the possible distances are ls = [50, 55, 57, 58, 60], the max amount of miles driven is 174 and the max number
of towns is 3...
-> All possible permutations of the distances are: 
  [50,55,57], 0, 1, 2
  [50,55,58], 0, 1, 3
  [50,55,60], 0, 1, 4
  [50,57,58], 0, 2, 3
  [50,57,60], 0, 2, 4
  [50,58,60], 0, 3, 4
  [55,57,58], 1, 2, 3
  [55,57,60], 1, 2, 4
  [55,58,60], 1, 3, 4
  [57,58,60]  2, 3, 4
-> If we convert these to sums we get [162, 163, 165, 165, 167, 168, 170, 172, 173, 175]
-> So the biggest possible of the sums less than 174 is 173, which is returned

# Algorithm:
- Get all possible permutations of the array of distances with the given length k
  - Initialize an array to hold all the different combinations
  - Iterate a loop from 0 to the size of the distances array - 3, tracking iteration (starting index)
    - Iterate a loop from 1 to size of distances array - 2, tracking iteration (second index)
      - Iterate a loop from second index + 1 to the size of distance array - 1 (last index)
        - Append the array [starting index, second index, last index] to the results array
  - Return the results array with all the combinations
  
- Iterate over these sub-arrays and transform each into the sum of the distance
- Select only those sums that are less than the given limit t
- Return the maximum number from the selected array elements
=end

def get_combinations(distances)
  combos = []
  (0..distances.size - 3).each do |start_idx|
    (start_idx + 1..distances.size - 2).each do |mid_idx|
      (mid_idx + 1...distances.size).each do |end_idx|
        combos << [distances[start_idx], distances[mid_idx], distances[end_idx]]
      end
    end
  end
  
  combos
end

def choose_best_sum(distance_limit, towns_limit, distances)
    get_combinations(distances).map do |sub_arr|
      sub_arr.sum
    end.select { |sum| sum <= distance_limit }.max
end

p choose_best_sum(174, 3, [50, 55, 57, 58, 60]) == 173 
p choose_best_sum(163, 3, [50, 55, 56, 57, 58]) == 163
p choose_best_sum(163, 3, [50]) == nil
p choose_best_sum(230, 3, [91, 74, 73, 85, 73, 81, 87]) == 228

# Alternatively, more flexible:
def choose_best_sum(distance_limit, towns_limit, distances)
  routes = distances.combination(towns_limit)
  routes.map { |route| route.sum }.select { |sum| sum <= distance_limit}.max
end