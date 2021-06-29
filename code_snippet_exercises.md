# Code Snippets for RB109 Written Prep

## Variable Scope

Local Scope

```ruby
# What is output when we execute the following code?
def a_method
  puts message
end

message = "hello there!"

puts message
a_method
```

Global Scope

```ruby
# What is output when we execute the following code?
# How does it differ from the example above?
MESSAGE = "hello there!"

def a_method
  puts message
end

puts MESSAGE
a_method
```

Local Scope

```ruby
# What is output when we execute the following code? Explain how and why
def a_method(message)
  puts message
end

message = "hello there!"

puts message
a_method(message)
```

Inner and Outer Scope

```ruby
# What is output when we execute the following code? Explain why
x = "blue"

4.times do
  x = "yellow"
  y = "purple"
end

puts x
puts y
```

What constitutes a block? / Inner Scope

```ruby
# What is output by the following code? Why?
i = 0
while i < 1 do
  a = "abcdefg"
  i += 1
end

loop do
  b = "abcdefg"
  break
end

puts a
puts b
```

Peer blocks create different & discreet inner scopes

```ruby
# What is output by the following code? Why?
2.times do
  a = "pizza"
  b = "spaghetti"
end

2.times do
  a = "pizza"
  puts a
  puts b
end

# if student does well, paste the following and ask what the object_id
# calls will output
2.times do
  a = 'pizza'
  b = 'spaghetti'
  puts a.object_id
end

2.times do
  a = 'pizza'
  puts a.object_id
end
# => ?
# => ?
```

Nested levels of inner and outer scope

```ruby
# What does the following code output? Why?
a = 'hamburger'

1.times do
  b = 'french fries'

  1.times do
    c = 'milkshake'

    puts a
    puts b
    puts c
  end

  puts a
  puts b
  puts c
end

puts a
puts b
puts c
```

Variable Shadowing

```ruby
# What does the following code output? Why?
a = 'poem'

%w(to be or not to be).each do |a|
  a = 'sonnet'
end

puts a
```

```ruby
# What does the following code output? Why?
a = 'string'

[1, 2, 3, 4, 5].each do |a|
  puts a
end

puts a
```

Local variables passed into methods as arguments cannot be altered within the method (unless they are _mutated_).

```ruby
# What does the following code output? Why?
a = 'some words'

def change_string(str)
  str = 'other words'
end

change_string(a)
puts a
```

Blocks within a method

```ruby
# What does the following code output? Why?
def a_method
  a = 'hamburger'

  1.times do
    a = 'actually, just salad please'
    b = 'but a side of fries as well'

    puts a
    puts b
  end

  puts a
  puts b
end

puts a
puts b
```

## Mutating Methods and Object Passing

Mutating Method vs Non-Mutating Method

```ruby
# What is output by the following code? Why?

a = 'string'
b = a.upcase
puts a == b
puts a.object_id == b.object_id

a = 'string'
b = a.upcase!

puts a == b
puts a.object_id == b.object_id
```

Variable Assignment is non-mutating

```ruby
# What is output by the following code? Why?
def make_uppercase(string)
  string = string.upcase
end

a = 'string'

puts make_uppercase(a)
puts a

# if student has trouble understanding use object_id to show what's going on
```

Assignment Operators can also break link between variable and object

```ruby
# What is output by the following code? Why?
def pluralize(string)
  string += 's'
  string
end

a = 'string'
pluralize(a)

puts a
```

Assignment can result in the variable being reassigned to the same reference object, but only if that same object is returned by the expression to the right of the assignment operator.

```ruby
# What is output by the following code? Why?
def proper_noun(string)
  string = string.capitalize!
  string
end

name = 'jane doe'
puts proper_noun(name)
puts name
```

Indexed Assignment is Mutating

```ruby
# What is output by the following code? Why?
def proper_noun(string)
  string[0] = string[0].capitalize
end

name = 'jane'
proper_noun(name)
puts name
```

```ruby
# What is output by the following code? Why?
def adds_one_to(array)
  array[0] += 1
  array
end

zeros = [0, 0, 0]
p adds_one_to(zeros)
p zeros
```

```ruby
# What is output by the following code? Why?
def add_one_to(nums)
  0.upto(nums.length) do |i|
    nums[i] += 1
  end

  nums
end

numbers = [0, 1, 2, 3, 4]

p add_one_to(numbers)
p numbers
```

Mutating Collections via their Elements

```ruby
# What is output by the following code? Why?
array = ['a', 'b', 'c', 'd', 'e']

array.each do |letter|
  letter.upcase!
end

p array
```

Concatenation is mutating (when using `<<`)

```ruby
# What is output by the following code? Why?
def adds_an_s(word)
  word << 's'
  word
end

noun = 'cat'
adds_an_s(noun)
puts noun
```

Mutating methods after the link between variable and object is broken

```ruby
def make_a_sentence(string)
  string = string.capitalize
  string += ' how are you'
  string << '?'
end

word = 'hello'
p make_a_sentence(word)
p word
```

