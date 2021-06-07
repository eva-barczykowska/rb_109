# Write a method that takes two numbers. Return an array containing all primes between the two numbers (include the two given numbers in your answer if they are prime). Don't use Ruby's 'prime' class.

# Input: two integers
  # Representing the beginning and end of an inclusive range
  # All numbers will be positive
# Output: an array of integers
  # All the prime numbers between the first and second given arguments

# Algorithm:
  # Initialize an empty array to hold the prime numbers
  # Iterate a loop from num1 upto num2, tracking iteration
    # Is the current iteration number prime?
    # If so, add it to the array
  # Return the array

  # Determine if a number is prime
    # Return false if it is less than 2
    # Iterate a loop from 2 up to the number (exclusive)
      # Check to see if the number is evenly divisible by the current iteration number
      # Return false if it is
    # If the current number is never evenly divisible by the iteration number, return true

    def prime?(num)
      return false if num < 2
      (2...num).each do |i|
        return false if num % i == 0
      end
      
      true
    end
    
    def find_primes(num1, num2)
      primes = []
      
      num1.upto(num2) do |i|
        primes << i if prime?(i)
      end
      
      primes
    end
    
    p find_primes(3, 10) == [3, 5, 7]
    p find_primes(11, 20) == [11, 13, 17, 19]
    p find_primes(100, 101) == [101]
    p find_primes(1, 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
    p find_primes(1, 2) == [2]
    