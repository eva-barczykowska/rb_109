=begin
We have a string s

We have a number n

Here is a function that takes your string, concatenates the even-indexed chars to the front, odd-indexed chars to the back.

Examples
s = "Wow Example!"
result = "WwEapeo xml!"
s = "I'm JomoPipi"
result = "ImJm ii' ooPp"
The Task:
return the result of the string after applying the function to it n times.

example where s = "qwertyuio" and n = 2:

after 1 iteration  s = "qetuowryi"
after 2 iterations s = "qtorieuwy"
return "qtorieuwy"

# Algorithm:
- Iterate a loop n times
- Initialize an empty results string
- Iterate over the input string with index
  - Prepend the current char to the results string if index is even
  - Append the current char to the results string if index is odd
- Return the results string
=end

def jumbled_string(string, n)
  results = string

  n.times do 
    even, odd = results.chars.partition.with_index { |char, idx| idx.even?}
    results = (even + odd).join
  end

  results
end

p jumbled_string("Such Wow!", 1) == "Sc o!uhWw"
p jumbled_string("better example", 2) == "bexltept merae"
p jumbled_string("qwertyuio", 2) == "qtorieuwy"
p jumbled_string("Greetings", 8) == "Gtsegenri"
