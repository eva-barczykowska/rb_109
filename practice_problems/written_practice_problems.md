# RB 109 Written Assessment Practice Problems

## Truthiness

```ruby
n = 0
puts 'true' if n = 3
```

Outputs the string `true`, because assignment returns the value which is assigned, which Ruby considers to be "truthy"

```ruby
def some_method
  "a string"
end

puts 'true' if some_method
```

Outputs the string `true`, because the method returns `"a string"` which is a truthy object

```ruby
def all_zero
  0
end

puts 'true' if all_zero
```

Outputs the string `'true'` because the method returns `0` which is a truthy object in Ruby.

```ruby
num = 4

if num = 2
  puts 'num is equal to 2'
else
  puts 'num is not equal to 2'
end
```

Outputs `num is equal to 2` because the assignment statement in the conditional is evaluated to `true`.

```ruby
[1, 1, 1, 1, 2, 2, 2, 2].select do |num|
  num = 2
end
```

Returns the array `[1, 1, 1, 1, 2, 2, 2, 2]` because `num = 2` returns a truthy value, and therefore every element is selected by `select`.

```ruby
['a', 'b', 'c', nil, 'd'].select do |letter|
  letter
end
```

Returns the array `['a', 'b', 'c', 'd']`. `nil` is not selected because it is a falsey value in Ruby.

## Arguments vs. Parameters

```ruby
puts display_message(message)
  puts message
end

display_message("hi there!")

# what is message? what is 'hi there'?
```

```ruby
def display_message(message = 'hi')
  puts message
end

display_message
display_message('goodbye')
```

Outputs the string `'hi'` which is the default value assigned to the parameter `message`, followed by the string `'goodbye'` which is passed as an argument in the second method call.

## nil

```ruby
def bad_math
  if 2 > 3
    'bad math'
  end
end

puts bad_math
```

Outputs nothing because the method `bad_math` returns `nil`

## Return Values with Blocks

```ruby
1.times { 2 + 2 }
# => returns '1'

[1].each { |num| num + 4 }
# => returns [1]

[1, 2, 3, 4].map { |num| puts num * 2 }
# => returns [nil, nil, nil, nil]

[1, 2, 3, 4].map { |num| num * 2 }
# => returns [2, 4, 6, 8]

[1, 2, 3, 4].select { |num| num % 2 }
# => returns [1, 2, 3, 4]

[1, 2, 3, 4].select { |num| num % 2 == 0 }
# => returns [2, 4]
```

## Methods as Arguments

```ruby
def adds_two(x, y)
  x + y
end

def some_num
  (1..10).to_a.sample
end

p adds_two(some_num, some_num)
```

## Method Chaining

```ruby
a = 'hello'
a.concat('!').upcase

# what does the above code return?
# why does it work?
```

## Implied Return

```ruby
def a_method
  "I am a return value!"
end

p a_method

def simple_math
  2 + 2
end

p simple_math
```

## Mutable Objects

```ruby
a = "a string object"
b = a
b.upcase!

p b
p a

p a.object_id == b.object_id
```

## Immutable Objects

```ruby
a = 2
b = a

a = 2 + 2

puts a
puts b

# with a reassignment shortcut

a = 2
b = a

a += 2

puts a
puts b
```

## Variable reassignment is not mutating

```ruby
# can you explain what's happening here?
a = 'string'
b = a
a = 'another string'

puts a
puts b
```

## Parallel Assignment

```ruby
a, b = [1, 2]
puts a
puts b
```

```ruby
array = ['blue', 'green']
a, b = array
puts a
puts b

a = 'purple'
puts array
```

```ruby
odds, evens = (1..10).partition { |num| num.odd? }
p odds
p evens
```

## Freezing Objects

```ruby
string = 'hello'
string.freeze
string << 'world'
```

Results in `FrozenError` because `string` is frozen

```ruby
1.frozen?
```

Returns `true` because `1` is an integer and therefore an immutable object

```ruby
array = ["apple", "book", "car", "dog"]
array.freeze
array[0] << 'sss'
p array
```

Outputs `["applessss", "book", "car", "dog"]` because the individual elements of the array are not frozen and can therefore be mutated.

However calls such as:

```ruby
array << "ear"
array[0] = 'ant'
```

will still result in a `FrozenError`.

## Variable Reference in a Nested Data Structure

```ruby
a = [1, 2]
b = [3, 4]
array = [a, b]
p array
```

Outputs the nested array `[[1, 2], [3, 4]]`.

```ruby
a = [1, 2]
b = [3, 4]
array = [a, b]
p array

a[0] = 0
p a
p array
```

Any changes made to the variable that references the inner collection will be reflected in the collection as a whole.
