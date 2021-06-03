=begin
Some numbers have funny properties. For example:

89 --> 8¹ + 9² = 89 * 1

695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n.
In other words:

Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

If it is the case we will return k, if not return -1.

Note: n and p will always be given as strictly positive integers.

- Input: an integer n and an integer p
  - n represents some number in which the digits will be split and added as successive powers of p
  - p represents the beginning of a series steping by 1 where they will be the powers of the digits of n
- Output: an integer k, if it exists, otherwise, -1
  - k is some number that may or may not exist in the forumla:
  (n[0]**p) + (n[1]**p + 1) + (n[2]**p + 2) ... (n[-1]**p + i) = n * k 

# Examples:

dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

# Algorithm:

- Convert n to an array of digits (reversed to ensure correct order)
- Initialize a product to 0
- Iterate over each digit with index
  - Increment the product by current_digit ** (p + index)
- Get both the quotient and remainder of integer division for product / n
- If the remainder is 0, return the quotient
- Otherwise, return -1
=end

def dig_pow(n, p)
  digits = n.digits.reverse
  product = 0
  digits.each_with_index do |digit, idx|
    product += digit**(p + idx)
  end
  
  k, remainder = product.divmod(n)
  remainder == 0 ? k : -1
end


p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46288, 3) == 51
p dig_pow(695, 2) == 2
