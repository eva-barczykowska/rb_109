# Practice Exam

You will have 3 hours to complete the test. This test has 23 questions. That is slightly less than 8 mins per question.

Suggested response format (based on feedback from other students & Srdjan’s blog post):

- What does the code output? What are the return values?
- Answer the why behind the output/return:
  - Focus only on the lines of code that deliver the output and return values.
- Summarize what the problem demonstrates and why: i.e. "This problem demonstrates the concept of local variable scope/etc…"
  - This can be at the beginning or end of your answer - personal preference.

The following questions are taken from the shared [RB109 Written Assessment: Practice Problems Google Doc](https://docs.google.com/document/d/16XteFXEm3lFbcavrXDZs45rNEc1iBxSYC8e4pLhT0Rw/edit#)

## 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

## 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
end
p new_array
```

## 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

## 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```

## 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

What are a, b, and c? What if the last line was `c = a.uniq!`?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```

## 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do `s` and `t` have? Why?

```ruby
def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)
```

## 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```

## 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do `s` and `t` have? Why?

```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

## 9

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```

## 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```

## 11

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

## 12

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
              n + 1
            end
p incremented
```

## 13

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4

loop do
  a = 5
  b = 3


  break
end

puts a
puts b
```

## 14

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```

## 15

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) 

puts y
```

## 16

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1 
puts arr2
```

## 17

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```

## 18

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
end
p new_array
```

## 19

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```

## 20

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value.upcase!
  value += '!'
  value
end

s = 'hello'
t = fix(s)
```

## 21

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do `s` and `t` have? Why?

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```

## 22

What does the following code return? What does it output? Why? What
concept does it demonstrate?

```ruby
a = %w(a b c)
a[1] = '-'
p a
```

## 23

What does the following code return? What does it output? Why? What
concept does it demonstrate?

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```
