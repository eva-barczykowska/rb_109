=begin

5 kyu

In this kata, you will write a function that returns the positions and the values of the "peaks" (or local maxima) of a numeric array.

For example, the array arr = [0, 1, 2, 5, 1, 0] has a peak at position 3 with a value of 5 (since arr[3] equals 5).

The output will be returned as an object with two properties: pos and peaks. Both of these properties should be arrays. If there is no peak in the given array, then the output should be {pos: [], peaks: []}.

Example: pickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) should return {pos: [3, 7], peaks: [6, 3]} (or equivalent in other languages)

All input arrays will be valid integer arrays (although it could still be empty), so you won't need to validate the input.

The first and last elements of the array will not be considered as peaks (in the context of a mathematical function, we don't know what is after and before and therefore, we don't know if it is a peak or not).

Also, beware of plateaus !!! [1, 2, 2, 2, 1] has a peak while [1, 2, 2, 2, 3] and [1, 2, 2, 2, 2] do not. In case of a plateau-peak, please only return the position and value of the beginning of the plateau. For example: pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]} (or equivalent in other languages)

Have fun!

- Input: an array of integers
- Output: a hash
  - key: position has an array of values that represent the index for the "peaks" in the input array
  - key: peak has an array of values that are the integers representing "peaks" in the input
  - what is a peak?
    - [0, 1, 2, 5, 1, 0] 5 is a peak
    - the first and last elements of the array cannot be peaks
    - a peak has both elements on either side as less than it
    - the start of a plateau is a peak
    - a plateau is a series of numbers that are equal or greater than (if the greater than number is last)

Examples: 

pick_peaks([1,2,3,6,4,1,2,3,2,1]) ==  {"pos"=>[3,7], "peaks"=>[6,3]}
        6    3
      3  4  2  2
    2      1    1
  1
pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}

pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
  2   3  2  2  2  2
    1  1            1

pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}

# Algorithm:

- Initialize my peaks + position hash
- Iterate over the input array with index
  - Skip the the first and last iterations
  - If the next number in the series is less than or equal to num and the earlier number in the series is less than num
    - Add current_peak to the peaks key
    - Add the current index to the pos key
- Return the peaks + position hash
=end

def pick_peaks(array)
  peaks = {"pos" => [], "peaks" => []}
  
  array.each_with_index do |num, idx|
    next if idx == 0 || idx == array.size - 1
    if array[idx + 1] <= num && array[idx - 1] < num && !(array[idx..-1].all? { |n| n == num})
      peaks["pos"] << idx
      peaks["peaks"] << num
    end
  end
  
  peaks
end

p pick_peaks([1,2,3,6,4,1,2,3,2,1]) ==  {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
p pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}