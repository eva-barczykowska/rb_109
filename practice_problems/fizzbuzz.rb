=begin
write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers except if a number is divisible by 3, print out "Fizz", if a number is divisible by 5, print out "Buzz", and if a number is divisible by 3 and 5, print out "FizzBuzz".

- Input: 2 integers
  - 1st representing the beginning of a range
  - 2nd representing the end of a range
  - inclusive or exclusive range?
- Output: 
  - Display to the console all numbers between arguments
  - If a num is a multiple of 3 print string 'Fizz'
  - If num is a multipe of 5 print string 'Buzz'
  - If num is multiple of both 3 & 5 print string 'FizzBuzz'
  - Return value expected?

# Examples:
fizzbuzz(1, 10)
fizzbuzz(1, 15)

# Algorithm:
  - Iterate a loop from first argument to second argument, tracking iteration number
    - If iteration number is multiple of 3 & 5, output fizzbuzz
    - If iteration number is multiple of 3 output fuzz
    - If iteration number is multiple of 5 output buzz
    - Otherwise output just the number
=end

def multiple?(num, mult_of)
  num % mult_of == 0
end

def fizzbuzz(num1, num2)
  num1.upto(num2) do |i|
    if multiple?(i, 3) && multiple?(i, 5)
      puts "FizzBuzz"
    elsif multiple?(i, 3)
      puts "Fizz"
    elsif multiple?(i, 5)
      puts "Buzz"
    else
      puts i
    end
  end
end

fizzbuzz(1, 10)
fizzbuzz(1, 15)
