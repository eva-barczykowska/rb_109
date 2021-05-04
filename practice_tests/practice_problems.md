# Practice Problems

All problems found in [RB109 Written Assessment: Practice Problems](https://docs.google.com/document/d/16XteFXEm3lFbcavrXDZs45rNEc1iBxSYC8e4pLhT0Rw/edit#)

## Local Variable Scope

### 1

**Current time:** appx 5 mins

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```

The following code will first output the string object `"Goodbye"` on one line followed by the string object `"Hello"` on the following line. It will return `nil`.

On line one, local variable `a` is initialized and assigned to the string object `"Hello"`. Then on line two, the local variable `b` is initializes and assigned to the object referenced by local variable `a`. At this point, both `a` and `b` point to the same object in memory. Then on line 3, local variable `a` is reassigned to the string object `"Goodbye"`. This breaks the link between `a` and the string object `"Hello"`.

Therefore, when `a` is passed to puts on line 4, `"Goodbye"` is output to the console. `b`, however, still points to the string object `"Hello"`, which is output when it is passed to `puts` on line 5. The method `puts` always returns `nil`, so both `puts` method calls will result in this return value.

This is a good example of how variables behave as pointers, and are not deeply linked to each other, even when one is assigned to the other. It also demonstrates how reassignment creates a new object in memory that will break the binding between the variable and the object it previously referenced.

### 2

**Current time:** 4 : 39

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

On line 1, local variable `a` is initialized to the integer object `4`.

On line 3, the `loop` method is invoked, and we pass it a block. This creates an inner scope. Within the block, local variable `a` is reassigned to the integer `5`. Then, local variable `b` is initialized to the integer `3`. Finally, we have a break statement that gets us out of an infinite loop.

When we pass `a` to `puts`, it references the integer object `5`, which is output to the console. This is because `a` is a local variable initialized in outer scope, so it is able to be accessed in the inner scope created by the block.

When we pass `b` to `puts`, it causes the program to throw a `NameError`. This is because `b` is a local variable that was initialized in inner scope, and outer scope cannot access variables that are initialized in inner scope.

The first `puts` call will return `nil`. The second will not have a return value, as the `NameError` is thrown before the method can complete it's execution.

This is an example of local variable scoping rules in relation to the inner and outer scope creates when a block is passed to a method call as an argument.

### 3

**Current time:** 5 : 04

What does the following code return? What does it output? Why? What concept does it demonstrate?

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

On line 1, local variable `a` is initialized and assigned to the integer object `4`. On line 2, local variable `b` is initialized and assigned to the integer object `2`.

On line 4, the `loop` method is invoked and passed a block as an argument. This creates an inner scope.

Within the block, local variable `c` is initialized and assigned to the integer object `3`. Then local variable `a` is reassigned to the object referenced by the local variable `c`. Now, both `a` and `c` point to the same object in memory.

When we pass `a` to the `puts` method, it will output the integer object `3` and return `nil`. This is because `a` is a local variable that was initialized in outer scope, so it is accessible in both inner and outer scope. When it is re-assigned in inner scope, that reassignment holds later in outer scope.

When we pass `b` to the `puts` method, it will output the integer object `2` and return `nil`. `b` is a local variable initialized in outer scope so it is accessible when passed to the `puts` method.

### 4

**Current time:** 5 : 21

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```

The above code shows a method definition and method call for the method `example`. This method takes a single argument, a string. When the method is invoked, the string object `'hello'` is passed as argument and assigned to the method parameter `str`.

Within the method, local variable `i` is initialized and assigned to integer object `3`. Then the `loop` method is invoked, and passed a block as an argument. Within the block, the object referenced by the parameter `str` is passed to `puts`. Because `str` references the object `'hello'`, this is what is output to the string. Then, local variable `i` is decremented by `1` (that is, it is reassigned to the value referenced by `i` minus `1`, which in this case results in the integer `2`).

There is a `break` statement that will cause the loop to stop executing when `i` references `0`. In this case, this causes the loop to execute three times. Therefore, the string `'hello'` will be output three times. The method returns `nil`.

This is an example of how object referenced by local variables can be passed to methods as arguments, where they are assigned to method parameters, in order to be used or manipulated in some way.

### 5

**Current time:** 3: 57

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)
```

The code consists of a method definition and invocation for the method `greetings`, which takes one argument.

First, local variable `word` is initialized and assigned the string object `"Hello"`. Then, `greetings` is invoked and passed the object referenced by `word` (the string `"Hello"`) as an argument. This is then assigned to the method parameter `str`.

Within the method, the object referenced by `str` is passed to `puts`. Because `str` references the string `"Hello"` which was passed to the method, `"Hello"` is output. Then the string literal `"Goodbye"` is passed to `puts` which outputs `"Goodbye"`.

Because the last line of the method is an expression that invokes `puts`, the return value of the method is `nil`, which is always returned by `puts`.

This is an example of how local variables can be passed into methods as arguments, and are then assigned to parameters which act as placeholders for the object they reference.

### 6

**Current time:** 11:09

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

First we initialize local variable `arr` and assign it the array `[1, 2, 3, 4]`. Then we initialize both local variable `counter` and local variable `sum` to separate integer objects `0` and `0`.

The `loop` method is invoked and passed a block as an argument. Within the block, we add the object refernced by `arr[counter]` to the local variable `sum`. `arr[counter]` on the first iteration will reference the first element in the collection referenced by `arr`, because `counter` references `0`. This object is the integer `1`. `sum`, then is reassigned to the object it referenced `0` plus `1`, which returns `1`.

Then we increment `counter` and reassign it to the value returned by the object referenced by counter (`0`) plus `1`. This returns `1`. The `break` statement checks to see if `counter` is equal to the size of the collection referenced by `arr` (which will return `4`). Counter is currently `0`, so the block will iterate again.

When the block iterates a second time, `sum` will be reassigned to the current sum (`1`) plus the next element in the array (`2`), which returns the value `3`. `counter` is again incremented by `1` which returns a value of `2`. This is still not equal to the size of the collection referenced by `arr` so the block iterates again.

On the third iteration of the block, the value referenced by the third element in `arr` is added to `sum`, which is reassigned to the object `6`. `counter` is again incremented and now references the object `3`. This is still not equal to the size of `arr` so the loop continues to the next iteration.

`sum` is again reassigned to the value returned by `sum` plus the fourth element in the collection `arr`. This returns `10`. `counter` is incremented again and now references the object `4`. This is equal to value returned by `arr.size`, and so we exit the loop.

Finally, we access the value referenced by `sum` using string interpolation in a string passed to `puts`. This outputs `"Your total is 10"` to the console and returns `nil`.

This is an example of how variables initialized in outer scope can be accessed, changed, and manipulated within inner scope. These values are maintained when the same variables are again accessed in outer scope.

### 7

**Current time:** 4: 04

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```

On line 1 we initialize local variable `a` and assign it the string object 'Bob'. Then we invoke the `times` method on the integer `5` and pass it a block as an argument. This creates an inner scope.

Within the block, local variable `a` is reassigned to the string object `'Bill'`. `a` is a variable initialized in outer scope so it is accessible within the inner scope created by the block. This breaks the link between `a` and the object it originally referenced (`Bob`) and creates a new binding between it and `'Bill'`.

Therefore, when we pass the object referenced by `a` to the `p` method, the program will output `"Bill"`. This is an example of how local variables initialized in outer scope can be accessed from the inner scope created by blocks. `p` returns the value that is passed to it, so the programs return value will be `"Bill"`.

### 8

**Current time:** 5:40

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var
```

First we initialize local variable `animal` and assign it to the string `"dog"`. Then we invoke the `loop` method and pass it a block as an argument. Within the block, we indicate that we will not be using a block parameter by utilizing the convention of naming the block parameter with an underscore (`_`).

The block passed to `loop` as an argument creates an inner scope. Within, local variable `animal` is reassigned to the string object `"cat"`. Because `animal` is a local variable that is initialized in outer scope, it is available within the block, and this reassignment will hold in outer scope.

Then we initialize local variable `var` and assign it to the string object `"ball"`. Because this variable is initialized in inner scope, it will not be available in outer scope.

This is demonstrated when we pass the object referenced by `animal` to the `puts` method, which outputs `"cat"` and returns `nil`. This shows that the variable was able to be reassigned in inner scope, and the change is visible in outer scope.

When we pass the object referenced by `var` to `puts`, however, the program will throw a `NameError`, because the local variable `var` is not accessible in outer scope. The program will throw an error before `puts` has a chance to complete execution, so there will be no return value in this case.

## Variable Shadowing

### 9

**Current time:** 6:53

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```

First we initialize local variable `a` and assign it the integer object `4`. Then we initialize local variable `b` and assign it the integer object `2`.

Next, the `times` method is invoked on the integer object `2`, and passed a block as an argument. The block has one parameter, `a`, which will be assigned the iteration number on each iteration of the block (beginning with `0`).

However, within the block, the parameter `a` is reassigned to the integer object `5`. Therefore, when we pass the object referenced by the block parameter `a` to the `puts` method within the block, `5` will be output.

The block executes twice, according to the method call, so `5` is output twice, each time on a different line. Because the last line of the block is a call to the `puts` method, the block will return `nil`.

Then, the object referenced by local variable `a` is passed to the `puts` method. This will output the integer object `4` and return `nil`. This is because when `a` is reassigned within the inner scope of the block, the block parameter of the same name `a` takes precedence, and this is what is reassigned in the place of the local variable `a` initialized in outer scope. This is an example of variable shadowing.

When the object referenced by `b` is passed to the `puts` method, `2` will be output and `nil` is returned.

### 10

**Current time:** 3:24

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
n = 10

1.times do |n|
  n = 11
end

puts n
```

First we initialize local variable `n` to the integer object `10`.

Next, we invoke the `times` method on the integer `1` and pass it a block as an argument. This creates an inner scope.

Within the block, the block parameter `n` is assigned the iteration number for each iteration (beginning with `0`). Then block parameter `n` is reassigned to the integer object `11`. Because the block parameter `n` and the local variable `n` have the same name, variable shadowing prevents local variable `n` from being accessed within the block.

Finally, we pass the object referenced by local variable `n` to the `puts` method as an argument. This will output `10`, because when we re-assign `n` within the block we are actually reassigning the block parameter and local variable `n` initialized in outer scope remains unchanged. The `puts` method will return `nil`.

### 11

**Current time:** 4:22

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal
```

First we initialize local variable `animal` and assign it to the string object `"dog"`. Next, we invoke the `loop` method and pass it a block as an argument. This creates an inner scope.

The block has one parameter, `animal`, which takes a value of `nil` as is typical when a block parameter is used with the `loop` method. The block parameter `animal` is reassigned within the block to the string object `cat`. Then we break out of the loop.

Because both the local variable `animal` initialized in outer scope and the block parameter `animal` have the same name, variable shadowing prevents us from accessing the local variable `animal` that was initialized in outer scope within the block. Therefore, when the object referenced by `animal` is passed to the `puts` method, the string `"dog"` is output, while `nil` is returned.

## Object Passing / Variables as Pointers

### 12

**Current time:** 3:08

What does the following code return? What does it output? Why? What concept does it demonstrate?

What are `a` and `b`?

```ruby
a = "hi there"
b = a
a = "not here"
```

On line 1 we initialize local variable `a` and assign it to the string object `"hi there"`. On line 2 we initialize local variable `b` and assign it to the object referenced by local variable `a`. At this point, both `a` and `b` are pointing to the same object in memory: the string `"hi there"`.

Then on line 3, we reassign local variable `a` to the string object `"not here"`. This breaks the link between `a` and the object it previously referenced (`"hi there"`). Now, both `a` and `b` point to separate objects in memory, the string `"not here"` and `"hi there"` respectively.

This illustrates the concept of variables as pointers.

### 13

**Current time:** ??

What does the following code return? What does it output? Why? What concept does it demonstrate?

What are `a` and `b`?

```ruby
a = "hi there"
b = a
a << ", Bob"
```

On line 1 we initialize local variable `a` to the string object `"hi there"`. On line 2 we initialize the local variable `b` to the object referenced by local variable `a`. Now both variables `a` and `b` reference the same object in memory, the string `"hi there"`.

On line 3, we use the concatenation operator (`<<`), a destructive method, to mutate the string object referenced by `a`. This appends `", Bob"` to `"hi there"`, returning the same string object that has been changed, `"hi there, Bob"`.

Because both `a` and `b` reference this object, the change will be visible if we access through `b` as well. That is, outputting both `a` and `b` to the console will result in the same string `"hi there, Bob"` printing.

This is an example of variables as pointers.

### 14

**Current time:** 4:36

What does the following code return? What does it output? Why? What concept does it demonstrate?

What are a, b, and c? What if the last line was `c = a.uniq!`?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```

On line 1 we initialize local variable `a` to the array object `[1, 2, 3, 3]`. On line 2 we initialize local variable `b` to the object referenced by `a`. Now both variables are pointing to the same array object `[1, 2, 3, 3]` in memory.

On line 3, we initialize local variable `c` and assign it the value returned by `a.uniq`. This statement called the `uniq` method on the object referenced by `a`. Because `uniq` returns a _new_ array, and not the original object, `c` will reference a different object in memory than `a` and `b`, namely, `[1, 2, 3]`.

Because the object referenced by `a` and `b` has not been changed, they still reference the original array `[1, 2, 3, 3]`.

If the destructive method `uniq!` was called on the object referenced by `a`, all local variables would reference the same object, the array `[1, 2, 3]`. This is because the `uniq!` method mutates the caller, so the same object, albeit modified, is returned by the method.

This is an example of using pointer variables to mutate objects in memory.

### 15

**Current time:** 8:10

What does the following code return? What does it output? Why? What concept does it demonstrate?

What is `a`? What if we called `map!` instead of `map`?

```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```

First, we initialize local variable `a` and assign it the array object `['a', 'b', 'c']`. Then, we invoke the test method defined above and pass it the array referenced by `a` as an argument.

Within the method, the array referenced by `a` is assigned to the parameter `b`. Then the `map` method is invoked on the object referenced by `b` (the array `['a', 'b', 'c']`). A block is passed as an argument to the `map` method, with the block parameter `letter`.

Because the `map` method returns a _new_ array object, where each element in the calling array is transformed according to the return value of the block that gets passed to it, we know that the `map` method in this case will return a new array object, `['I like the letter: a', 'I like the letter: b', 'I like the letter: c']`.

This is because each element in the calling array (`['a', 'b', 'c']`) is passed to the block on each iteration, and used in string interpolation to return the strings listed in the array above.

Because the call of `map` is the last bit of code in the `test` method, the array `['I like the letter: a', 'I like the letter: b', 'I like the letter: c']` will be returned by `test`.

We can demonstrate that the array returned by `test` is a new object and that `a` has remained unchanged by passing both to `puts` and seeing what is output on the screen.

```ruby
puts a        # => ['a', 'b', 'c']
puts test(a)  # => `['I like the letter: a', 'I like the letter: b', 'I like the letter: c']`
puts a        # => ['a', 'b', 'c']
```

This is an example of how objects passed into Ruby method can act as if they are _pass by value_.

### 16

**Current time:** 3:45

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 5.2
b = 7.3

a = b

b += 1.1
```

First, we initialize the local variable `a` and assign it to the float object `5.2`. Then, we initialize the local variable `b` and assign it to the float object `7.3`.

Then, we reassign `a` to the object referenced by `b`. Now, both local variables point to the same object in memory, the float `7.3`.

Finally, we reassign `b` using the `+=` shorthand provided by Ruby's syntactical sugar. This is equivalent to reassigning `b` to the value returned by `b + 1.1`. This statement will return a _new_ float object `8.4`. The link between `b` and the object it previously referenced, `7.3`, is broken.

Now both `a` and `b` reference different objects in memory. `a` references the float `7.3` and `b` references `8.4`. This can be demonstrated by passing each to `puts` and seeing what value is output on the screen.

### 17

**Current time:** 7:38

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str
```

First we initialize the variable `test_str` and assign it to the string object `'Written Assessment'`. Then we invoke the `test` method (defined above) and pass it the object referenced by `test_str` as an argument.

Within the method, this object (the string `'Written Assessment'`) gets assigned to the parameter `str`. Now both `test_str` and `str` point to the same object in memory. This is because Ruby is a pass by reference language.

However, when we use the shorthand `+=` provided by Ruby's syntactical sugar to reassign `str`, we break the link between `str` and the original string object `'Written Assessment'` (still referenced by `test_str`). This is because we are, in fact, assigning `str` to the return value of `str + '!'` and the `+` method returns a _new_ string object, `'Written Assessment!'`.

On the next line, we call the destructive `downcase!` method on the object referenced by `str`. Because this method mutates the caller, it will return the same object, modified, `'written assessment!'`. Because there is no more code to evaluate in the method, this will also be the return value of `test(test_str)`.

When we pass `test_str` to `puts` it will output `'Written Assessment'` to the screen and return `nil`. This is because the link between `test_str` and the method parameter `str` was broken by reassignment within the `test` method. This is an example of how Ruby can act as if it were a pass by value language.

### 18

**Current time:** 6:24

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)

puts a
puts b
```

First, we initialize local variable `a` and assign it to the integer `3`. Next, we initialize local variable `b` and assign it to the value returned by the `plus` method (defined above) when passed the object referenced by `a` and the integer `2` as arguments.

When we invoke the `plus` method and pass it `a` and `2` as arguments, the object referenced by `a` gets assigned to the method parameter `x` and the integer `2` gets assigned to the method parameter `y`. Now both `x` and `a` reference the same object in memory.

Within the method, however, we reassign `x` to the value returned by `x + y`. Because integers are immutable objects, the `+` method returns a _newly created object_, breaking the link between `x` and the integer `3` referenced by `a`. `x` will now reference the integer `5`.

Because there is no more code to be evaluated within the method, the integer `5` will also be the return value of the `plus` method call, and is assigned to the local variable `b`.

Therefore, when we pass `a` to `puts`, `3` will be output and `nil` returned. When we pass `b` to `puts`, `5` will be output and `nil` returned.

This is an example of how reassignment of parameters within a method can break the link between a variable and the object it references, causing Ruby to behave as if it is a pass by value language.

### 19

**Current time:** 5:13

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) 

puts y
```

First we initialize the local variable `y` and assign it the string object `'a'`. Then we call the `increment` method (defined above) and pass it the object referenced by `y` as an argument.

Within the method, this object, the string `'a'`, gets assigned to the method parameter `x`. Now both `y` and `x` reference the same object in memory.

We then call the `<<` method on the object referenced by `x` and pass it the string `'b'` as an argument. `<<` is a method that mutates the caller, and returns the calling object after modification. The string object `'a'`, therefore, is mutated to `'ab'` and this change will be visible everywhere that object is referenced (i.e. both through `x` and `y`).

Because there is no more code to be evaluated within the method, `'ab'` is also the return value of the `increment` method call.

When we pass the object referenced by `y` to `puts`, it is still the same modified string. Therefore, `puts` will output `'ab'` and return `nil`.

This is an example of how Ruby behaves as a pass by reference language with respect to mutating methods.

### 20

**Current time:** 5:12

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def change_name(name)
  name = 'bob'      # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name 
```

First, we initialize the local variable `name` and assign it to the string object `'jim'`. Then, we invoke the `change_name` method (defined above) and pass it the object referenced by `name` as an argument.

Within the method, this object, the string `'jim'` is assigned to the method parameter `name`. At this point, both `name` outside the method and `name` within the method reference the same string object, `'jim'`.

However, within the method we reassign the method parameter `name` to the string object `'bob'`. This breaks the link between the parameter `name` and the object it previously referenced (`'jim'`). Because there is no more code within the method to evaluate, the string object `'bob'` is returned by the `change_name` method invocation.

When we pass `name` to `puts` outside the method, `name` will still reference the string object `'jim'`, which will be output to the screen. `puts` returns `nil`.

In order to change the value of `name` outside the method, given the nature of how the `change_name` method is defined, we will have to save it's return value in `name` via reassignment:

```ruby
name = 'jim'
name = change_name(name)
puts name     # => 'bob'
```

This is an example of how reassignment within the method can cause Ruby to behave as a pass by value language.

### 21

**Current time:** 3:58

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name
```

First we initialize local variable `name` and assign it to the string object `'jim'`. Then we invoke the `cap` method (defined above) and pass it the object referenced by `name` as an argument.

Within the method, this object (the string `'jim'`) gets assigned to the method parameter `str`. At this point, both `str` and `name` reference the same object in memory.

Within the method we call the destructive `capitalize!` method on the object referenced by `str`. `capitalize!` mutates the caller, and returns the same object that is referenced by both `str` and `name` after it's been modified. `str` and `name`, therefore, now both reference the string `'Jim'`.

Because there is no more code to be evaluated within the method, the `cap` method invocation will return the string `'Jim'`.

When we pass `name` to `puts`, it will still reference the mutated object, `'Jim'` which is output to the console. `puts` returns `nil`.

This is an example of how Ruby can behave as a pass by reference language with respect to mutating methods.

### 22

**Current time:** 6:57

What does the following code return? What does it output? Why? What concept does it demonstrate?

What is `arr` here?

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr

a[1] = 5
arr
```

First we initialize local variable `a` and assign it to the array object `[1, 3]`. Then we initialize local variable `b` and assign it to the array object `[2]`. Next we initialize local variable `arr` and assign it to the array `[a, b]`. This means that the first element in the array `arr` will be the array referenced by `a` and the second element in the array `arr` will be the array referenced by `b`, creating nested array `[[1, 3], [2]]`.

The nested array `[[1, 3], [2]]` is returned by `arr`. In this case, using element reference with nested array `arr` will reference the same objects in memory as local variables `a` and `b`.

```ruby
arr[0].object_id == a.object_id   # => true
arr[1].object_id == b.object_id   # => true
```

Therefore, when we use the array method `[]=` for element reassignment (which modifies the caller) on the array object referenced by `a`, it will modify the same object referenced by `arr[0]`.

This is shown when we reference `arr` after the element reassignment, which will return the modified nested array `[[1, 5], [2]]`.

### 23

**Current time:** 8:41

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

First we initialize local variable `arr1` and assign it the array object `["a", "b", "c"]`. Then we initialize local variable `arr2` and assign it to the value returned by calling the `dup` method on the object referenced by `arr1`. This returns the new array `["a", "b", "c"]`, a shallow copy of `arr1`.

Then, we call the destructive `map!` method on the object referenced by `arr2`, and pass it a block as an argument. `map!` iterates over the calling array and passes each element into the block, where it is assigned to the block parameter `char`.

Within the block, we call the non-destructive `upcase` method on the object referenced by `char`. `upcase` returns a _new_ string object, `"A"`, `"B'`, `"C"` on each iteration respectively. Because there is no more code to be evaluated within the block, this is also the return value of the block.

`map!` uses the return value of the block to destructively modify each element within the array that calls it. Therefore it will return the same array object referenced by `arr2` with the newly created string elements within, `["A", "B", "C"]`.

Because we did not use a destructive method on the level of elements within the collection, and rather returned a _new_ object for transformation, the original elements within `arr1` are left unchanged.

Therefore, when we pass the object referenced by `arr1` to `puts` the strings `"a"`, `"b"`, and `"c"` will be output on individual lines and `nil` returned.When we pass the object referenced by `arr2` to `puts`, the strings `"A"`, `"B"`, and `"C"` will be output on individual lines and `nil` returned.

This is an example of how you can destructively modify a shallow copy of a collection object without affecting the original object, as long as any modifications are called on the _collection as a whole_ rather than on individual elements within the collection.

## Object Mutability / Mutating Methods

### 24

**Current time:** 6:46

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```

First we initialize the local variable `s` and assign it to the string object `'hello'`. Then we initialize the local variable `t` and assign it to the value returned by the `fix` method (defined above) when passed the object referenced by `s` as an argument.

When we invoke the `fix` method and pass it the object referenced by `s`, this object (the string `'hello'`) is assigned to the method parameter `value`. Now both `s` and `value` reference the same object in memory.

Within the method, we invoke the destructive method `upcase!` on the object referenced by `value`. This mutates the caller, returning the same string object but modified to `'HELLO'`. This change will be visible wherever the object is referenced, i.e. both via `s` and `value`.

Next, we invoke the destructive method `concat` and pass it the string `'!'` as an argument. This also mutates the caller, returning the same string object but modified to `'HELLO!'`. This change will be visible wherever the object is referenced, i.e. both via `s` and `value`.

Finally, the last line of code in the method is just the object referenced by `value`, ensuring that the string object `'HELLO!'` (referenced by both `s` and `value`) is the return value of the `fix` method.

We assign this object to the local variable `t`. The consequence of this is that now both `t` and `s` point to the same object in memory, the string object `'HELLO!'`. This can be demonstrated by passing both `s` and `t` to `puts`, which will output `'HELLO!'` in both cases.

This is an example of how ruby can act like a pass by reference language with regards to mutating methods.

### 25

**Current time:** 6:25

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

First we initialize the local variable `s` and assign it to the string object `'hello'`. Then we initialize local variable `t` and assign it to value returned by the `fix` method (defined above) when we pass it the object referenced by `s` as an argument.

When we invoke the `fix` method, and the object referenced by `s` (the string `'hello'`) as an argument, that object gets assigned to the method parameter `value`. Now both `s` and `value` reference the same object in memory.

Within the method, however, we reassign `value` to the object returned by invoking the method `upcase` on the object referenced by `value`. In this case, we `upcase` does not mutate the caller, and returns a newly created string object, `'HELLO'`. This breaks the link between `value` and the original string object referenced by `s`, `'hello'`.

Next, we invoke the destructive method `concat('!')` on the object referenced by `value`. This does mutate the caller, returning the same string object but modified, `'HELLO!'`. However, because this now a separate object in memory, it will have no effect on the string object `'hello'` referenced by `s`.

Because there is no more code to evaluate within the method, `fix` returns this string object `'HELLO!'` which gets assigned to the local variable `t`.

`t` and `s`, then, both point to different objects in memory. This can be shown by passing each to `puts`. `s` will output `'hello'` and return `nil`, while `t` will output `'HELLO!'` and return `nil`.

This is an example of how re-assignment within a method can cause Ruby to act like a pass by value language.

### 26

**Current time:** 8:06

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

First we initialize local variable `s` and assign it to the string object `'hello'`. Then we initialize local variable `t` and assign it to the value returned by the `fix` method (defined above) when we pass it the object referenced by `s` as an argument.

When we invoke the `fix` method, we assign that object (the string `'hello'`) to the method parameter `value`. At this point, both `s` and `value` reference the same object in memory.

Within the method, we call the destructive `<<` method on the object referenced by `value`. `<<` mutates the calling object and returns that same object, changed to `'helloxyz'`. Because this object is referenced by both `value` and `s`, this change will be visible via either variable.

On the next line, however, we reassign `value` to the object returned by `value.upcase`. The `upcase` method returns a _new_ object and does not mutate the caller. `value`, then, now references the newly created string object `'HELLOXYZ'`. This breaks the link between `value` and the original object referenced by `s`, `'helloxyz'`. Each now references a separate object in memory.

On the next line, we invoke the destructive `concat` method on the object referenced by `value` and pass it the string argument `'!'`. This mutates the caller and returns that same object, changed to `'HELLOXYZ!'`.

Because there is no more code to be evaluated within the method, `fix` returns this object, which is then assigned to the local variable `t`.

Because of the reassignment of `value` within the method, `t` and `s` will not reference the same object in memory. This can be shown by passing each to `puts`. `s` will output `'helloxyz'` and return `nil`, while `t` will output `'HELLOXYZ!'` and return `nil`.

This is an example of Ruby can act like pass by reference with regards to mutating methods, but reassignment breaks that link and causes it to act like pass by value. In reality, Ruby is a pass by reference value language, which is why it can appear to include both behaviors.

### 27

**Current time:** 5:32

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)
```

First we initialize local variable `s` and assign it the string object `'abc'`. Then we initialize local variable `t` and assign it the value returned by the `fix` method (defined above) when we pass the object referenced by `s` as an argument.

When we invoke the `fix` method and pass `s` as an argument, the object `'abc'` is assigned to the method parameter `value`. Now both `s` and `value` reference the same object in memory.

Within the method, we use the string `[]=` method for element reassignment. This mutates the caller, the object referenced by `value`, and returns the same object with the character at index 1 reassigned from `'b'` to `'x'`; `'axc'`. Because this object is also referenced by `s`, the change will be visible there as well.

We end the method with the object referenced by `value`, which ensures that the object `'axc'` is returned by the `fix` method call and assigned to `t`. Because this object is also referenced by `s`, both `s` and `t` now reference the same object in memory.

This can be demonstrated by passing each variable to `puts`. `s` will output `'axc'` and return `nil`, and `t` will output the same string `'axc'` and return `nil`.

This is an example of how element reassignment, or _setter methods_ should be treated as mutating with regards to collections, demonstrating Ruby's ability to act as a pass by reference language.

### 28

**Current time:** 3:48

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```

First we initialize local variable `a` and assign it the string object `'hello'`. Then we invoke the `a_method` method (defined above) and pass it the object referenced by `a` as an argument.

When we invoke `a_method`, this object (the string `'hello'`) is assigned to the method parameter `string`. At this point, both `string` and `a` reference the same object in memory.

Within the method, we invoke the destructive method `<<` on the object referenced by `string`. This method mutates the caller, and returns the same string object changed to `'hello world'`. Because `a` still references this object, this change will be visible if we access the string object via `a`.

This can be demonstrated when we pass `a` to `p` in the final line, which outputs the string `'hello world'`. This is an example of how Ruby can act like a pass by reference language with regards to mutating methods.

### 29

**Current time:** 4:13

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
num = 3

num = 2 * num
```

First we initialize the local variable `num` and assign it the integer `3`. Then we reassign `num` to the value returned by `2 * num`.

Integers are immutable objects. Therefore, any operations upon them (as through the `*` method here) result in a newly created integer object.

In this case, `2 * num` is calling the `*` method on the integer `2` and passing the object referenced by `num` (`3`) as an argument. It will return the new integer object `6` which is assigned to `num`.

This can be demonstrated by showing the different object ids of the integers throughout the program.

```ruby
num = 3
puts num.object_id    # => 7

num = 2 * num
puts num              # => 6
puts num.object_id    # => 13
```

### 30

**Current time:** 5:28

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = %w(a b c)
a[1] = '-'
p a
```

First we initialize local variable `a` and assign it the array object `["a", "b", "c"]`. Then we invoke the setter method `[]=` for element reassignment.

This reassigns the element at index 1 of the array referenced by `a` from the string object `"b"` to the string object `"-"`. Because `a` is a collection, we consider this to be a destructive action that modifies the collection permanently. Though the element at index 1 is a new object, the array object is not. We can show this by comparing the object id of `a` both before and after element reassignment.

```ruby
a = %w(a b c)
a.object_id       # => 260
a[1] = '-'
a.object_id       # => 260
p a               # => ["a", "-", "c"]
```

Because the array object referenced by `a` remains the same, but it's element at index 1 has been reassigned, `["a", "-", "c"]` will be output when we pass `a` to `p` at the end of the program.

This demonstrates how element reassignment within a collection is a destructive action that permanently modifies the calling collection.

### 31

**Current time:** 8:20

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

First we initialize local variable `names` and assign it the array object `['bob', 'kim']`. Then we invoke the `add_name` method (defined above) and pass it the array referenced by `names` and the string object `'jim'` as arguments.

When we invoke the `add_name` method array referenced by `names` (`['bob', 'kim']`) is assigned to the method parameter `arr` and the string object `'jim'` is assigned to the method parameter `name`.

Within the method, we reassign `arr` to the value returned by `arr + [name]`. Here, we are putting the string object `'jim'` into an array and passing it to the array `+` method as an argument, which is called on the array object referenced by `arr` `['bob', 'kim']`.

Because `+` is not a destructive method, it returns a newly created array object, `['bob', 'kim', 'jim']`, which is assigned to the method parameter `arr`. This breaks the link between `arr` and the original array object `['bob', 'kim']` that was also referenced by `names`.

There is no more code within the method to evaluate, so the method invocation `add_name` returns the new array object `['bob', 'kim', 'jim']`. The original `names` array is not affected by being passed into the method, which is shown when we pass it to `puts`, which outputs `['bob', 'kim']` and returns `nil`.

This is an example of how reassignment within the method can cause Ruby to act like a pass by value language. If we want to preserve the changes made by the `+` method within `add_name`, we will need to save the method's return value by re-assigning `names`.

```ruby
names = ['bob', 'kim']
names = add_name(names, 'jim')
p names       # => ['bob', 'kim', 'jim']
```

### 32

**Current time:** 6:39

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

First we initialize the local variable `names` and assign it the array object `['bob', 'kim']`. Then we invoke the `add_name` method (defined above) and pass it the `names` array and the string `'jim'` as arguments.

When we invoke `add_name`, the object referenced by `names` (`['bob', 'kim']`) is passed into the method and assigned to the method parameter `arr`. Now `names` and `arr` point to the same object in memory. The string object `'jim'` is also passed into the method and assigned to the method parameter `name`.

Within the method, we reassign `arr` to the value returned by calling `<<` on the object referenced by `arr` and passing the object referenced by `name` as an argument. Essentially, the value returned by `['bob', 'kim'] << 'jim'`.

Because `<<` is a destructive method that mutates the caller, it will modify the calling object and return that object. Recall that both `arr` and `names` reference this object. Therefore, the same object referenced by `arr` and `names` is reassigned to `arr`. Although, it is changed to `['bob', 'kim', 'jim']` by the concatenation operation done by `<<`.

Normally, we would consider reassignment to break the link between a variable and the object it previously referenced. However, in this case, we are reassigning the same object back to the variable, so the link between the two is maintained.

Because there is no more code within the method to evaluate, the array object, referenced by both `arr` and `names`, is returned by the method.

When we pass `names` to `puts`, we will see the change is visible here as `['bob', 'kim', 'jim']` is output and `nil` is returned.

## Each, Map, and Select

### 33

**Current time:** 6:40

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
```

First we initialize local variable `array` and assign it the array object `[1, 2, 3, 4, 5]`. Then we call the `select` method on the object referenced by `array` and pass it a block as an argument.

When we call `select`, it iterates over the calling array and passes each element into the block. The current iteration's element is assigned to the block parameter `num`.

Within the block, we have a conditional statement, which will execute `puts num` if `num` is odd. We can see that array elements `1`, `3`, and `5` will be output, `odd?` returns `true` when called on these values.

If `num.odd?` returns `true`, and the `puts` invocation is executed, `puts` will return `nil`. If `num.odd?` returns `false`, the `puts` invocation is not executed, and the conditional as a whole returns `nil`. Because there is no other code in the block to be evaluated, `nil` becomes the return value of the block on each iteration.

`select` uses the return value of the block to perform selection. It will return a new array of those elements from the calling collection for which the block returns a truthy value. In this case, the block always returns `nil`, so `select` will return an empty array.

This example demonstrates how a beginning programmer might confuse output with return value. `puts` here will output the desired values to the console, but since the return value is `nil`, the desired selection will not occur. A better statement to use within the block would be simply, `num.odd?`. In this case, `select` would have returned the array `[1, 3, 5]`.

### 34

**Current time:** 3:57

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

First we initialize local variable `arr` and assign it the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Then we invoke the `select` method on the object referenced by `arr` and pass it a block as an argument.

When we invoke `select`, it iterates over the array `arr` and passes each element to the block. The current iteration's element is assigned to the block parameter `n`.

Within the block, we call the `odd?` method on the object referenced by `n`. This will return either `true` or `false` depending on whether the integer element is an odd or even number. For example, `1` on the first iteration will return `true`, `2` on the second iteration will return `false`, and so on.

Because there is no more code to be evaluated within the block, this boolean will be the return value of the block. `select` uses the return value of the block to perform selection. It returns a new array consisting of all those elements from the calling array for which the block returns a truthy value. In this case, these will be the integers `1`, `3`, `5`, `7`, and `9`. Therefore, `select` returns the array `[1, 3, 5, 7, 9]`.

### 35

**Current time:** 6:29

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
end
p new_array
```

First we initialize local variable `arr` and assign it the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Then we initialize the local variable `new_array` and assign it the value returned by calling the `select` method on `arr`.

When we call the `select` method on the object referenced by `arr`, we pass it a block as an argument. `select` iterates over all the elemtns in the calling array `arr` and passes each into the block. The current iteration's element is assigned to the block parameter `n`.

Within the block, we call the `+` method on the object referenced by `n` and pass it the integer `1` as an argument. This returns a new integer, whatever the value of `n` is on any given iteration incremented by `1`. For example, on the first iteration `n` will be `1` so it will return `2`, on the second, `n` will be `2` so the statement will return `3`, and so on.

Because there is no more code to be evaluated within the block, this will also be the return value of the block. `select` uses the return value of the block that gets passed to it to perform selection. It will return a new array of all the elements from the calling array for which the block returns a truthy value.

In this case, the block is returning an integer on every iteration. Because Ruby considers all object except for `false` and `nil` to be truthy, the block returns a truthy value on every iteration. Therefore, `select` will return an array containing all the elements from the calling collection, namely, `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

This array object will get assigned to the local variable `new_array` as can be demonstrated when we pass `new_array` to the `p` method, which outputs `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

### 36

**Current time:** 6:05

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
  puts n
end
p new_array
```

First we initialize the local variable `arr` and assign it the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Then we initialize the local variable `new_array` and assign it the value returned by calling the `select` method on the object referenced by `arr`.

When we call `select` on `arr` we pass it a block as an argument. `select` iterates over each element in the calling array `arr` and passes each to the block. The current iteration's element is assigned to the block parameter `n` on each given iteration.

Within the block, we increment `n` by `1` using the `+` method. However, because integers are immutable objects, this does not modify the object referenced by `n`. The return value of `n + 1` is never saved in a variable for re-use, so ostensibly, it is ignored.

We then pass `n` to the `puts` method. This will output `n` to the console, which will be the current iteration's array element unchanged. For example, on the first iteration `1` will be output, on the second `2`, and so on. `puts` returns `nil` on each occasion.

Because there is no more code within the block to be evaluates, `nil` becomes the return value of the block. `puts` is always the last method call in the block, so the block will always return `nil`.

`select` uses the return value of the block to perform selection. It will return a new array containing all those elements from `arr` for which the block returns a truthy value. Ruby considers `nil` to be a falsey value, so select in this case will return an empty array.

Therefore, the value assigned to local variable `new_array` is an empty array object `[]`. This is demonstrated when we pass the object referenced by `new_array` to the `p` method and `[]` is output to the console.

### 37

**Current time:** 7:14

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```

First we initialize local variable `words` and assign it the array object `['jump', 'trip', 'laugh', 'run', 'talk']`. Then we initialize local variable `new_array` and assign it the value returned by invoking the `map` method on the array referenced by `words`.

When we invoke the `map` method on `words`, we pass it a block as an argument. `map` will iterate over all the elements in the array referenced by `words`, passing each into the block. The current iteration's element will be assigned to the block parameter `word`.

Within the block, we invoke the `start_with?` method on the string referenced by `word` and pass it the argument `'t'`. `start_with?` checks to see if the calling string has the character `'t'` at index 0. If it does, `start_with?` will return the Boolean `true`, otherwise, it will return `false`. For example, on the first iteration, `word` references the string `'jump'`, so `start_with?` will return `false`. On the second iteration, `word` will reference the string `'trip'` and the method will return `true`.

Because there is no more code to be evaluated within the block, this will also be the return value of the block. `map` uses the return value of the block that gets passed to it to perform transformation, returning a new array containing the return value of the block for each element in the calling array. In this case, `map` will return the array `[false, true, false, false, true]`.

### 38

**Current time:** 3:35

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }
```

First we initialize the local variable `arr` and assign it the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Then we invoke the `each` method on the object referenced by `arr` and pass it a block as an argument.

`each` iterates over all the elements in the calling array `arr` and passes each into the block. The current iteration's element is assigned to the block parameter `n`.

Within the block, we pass the object referenced by `n` to the `puts` method. This will output each individual element on it's own line, and return `nil`.
`each` ignores the return value of the block, and always returns the original calling collection.

In this case, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10` will be output by `puts` on each iteration of the block, and `each` will return the array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

### 39

**Current time:** 4:20

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n| 
            n + 1
            end
p incremented
```

First we initialize local variable `arr` and assign it the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Then we initialize local variable `incremented` and assign it the value returned by invoking `map` on the array `arr`.

When we invoke `map` on the object referenced by `arr`, we pass it a block as an argument. `map` iterates over each element in the calling array and passes it to the block, where it is assigned to the block parameter `n`.

Within the block, we invoke the `+` method on the object referenced by `n`, and pass it the argument `1`. This increments the value of `n` by `1`, returning `2` on the first iteration, `3` on the second, `4` on the third, and so on.

Because there is no more code to be evaluated within the block, this integer becomes the return value of the block as well. `map` uses the return value of the block to perform transformation. It returns a new array in which each element is the return value of the block for each element in the calling array. In this case, it will return the array `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.

This array, then, gets assigned to the local variable `incremented`. When we pass `incremented` to `p`, it will output `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.

### 40

**Current time:** 5:30

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
end
p new_array
```

First we initialize the local variable `arr` and assign it the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Then we initialize local variable `new_array` and assign it the value returned by invoking `map` on the array `arr`.

When we invoke `map`, we pass it a block as an argument. `map` iterates over the elements in the calling array `arr` and passes each to the block, where it is assigned to the block parameter `n`.

Within the block, we check to see if the object referenced by `n` is greater than `1`. This returns a Boolean, either `true` or `false`. For example, on the first iteration, `n` references the integer `1`, so the statement will return `false`. On the second iteration, `n` references `2`, so the statement will return `true`.

Because there is no more code to be evaluated within the block, this Boolean value becomes the return value for the block. `map` uses the return value of the block to perform transformation, returning a new array in which each element is the return value of the block for each element in the calling collection. In this case, `map` will return the array, `[false, true, true, true, true, true, true, true, true, true]`.

This array gets assigned to the local variable `new_array`. Therefore, when we pass `new_array` to `p` as an argument, the array `[false, true, true, true, true, true, true, true, true, true]` is output to the console.

This is an example of how `map` always uses the return value of the block for transformation. The code within the block, in this case, may be better suited for the `select` method, depending on the programmers intentions.

### 41

**Current time:** 5:44

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
  puts n
end
p new_array
```

First we initialize local variable `arr` and assign it the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Then we initialize local variable `new_array` and assign it the value returned by invoking `map` on the array `arr`.

When we invoke the `map` method, we pass it a block as an argument. `map` iterates over the elements in the calling array `arr` and passes each into the block. The current iteration's element is assigned to the block parameter `n`.

Within the block, we first check to see if the object referenced by `n` is greater than `1`. This will return a Boolean, `true` if `n` is greater than `1` or `false` otherwise. Because this return value is not saved into a variable for re-use, it is ostensibly ignored.

Next, we pass `n` to `puts` as an argument. This will output the value of `n` to the console, and return `nil`. For example, on the first iteration `1` will be output, `2` on the second iteration, `3` on the third, and so on. `puts` always returns `nil`.

Because there is no more code to be evaluated within the block, `nil` becomes the return value of the block on every iteration. `map` uses the return value of the block to perform transformation, returning a new array in which each element is the return value of the block for each element in the calling collection `arr`. In this case, `map` will return the array, `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`.

This array is then assigned to the local variable `new_array`. When we pass `new_array` to `p`, then, the array `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]` is output.

### 42

**Current time:** 3:31

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```

First we initialize local variable `a` and assign it to the string object `'hello'`. Then we invoke the `map` method on the array literal `[1, 2, 3]` and pass it a block as an argument.

`map` iterates over each element in the calling array `[1, 2, 3]`, passing each to the block and assigning it to the block parameter `num`.

Within the block, `num` is not used. We simply access the value referenced by `a`, which returns the string `'hello'`. `a` is accessible within the inner scope created by the block because it is a local variable initialized in outer scope.

Because there is no further code to be evaluated within the block, the return value of the block becomes `'hello'` on each iteration. `map` uses the return value of the block to perform transformation, returning a new array where each element is the value returned by the block for each element in the calling array. In this case, `map` will return the array `['hello', 'hello', 'hello']`.

### 43

**Current time:** 3:21

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

Here we are invoking the `each` method on the array literal `[1, 2, 3]` and passing it a block as an argument. `each` iterates over the elements in the calling array and passes each into the block, where it is assigned to the block parameter `num`.

Within the block, we invoke the `puts` method and pass it the object referenced by `num` as an argument. On the first iteration, `puts` will output `1`, on the second `2`, and on the third `3`. In all three instances, `puts` returns `nil`.

Because there is no more code to be evaluated within the block, the block will also return `nil` on all three iterations. `each`, however, ignores the return value of the block and always returns the calling collection. In this case, the return value of `each` will be the array `[1, 2, 3]`.

## Other Collection Methods

### 44

**Current time:** 4:27

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```

Here we are calling the `any?` method from the Enumerable module on the array literal `[1, 2, 3]` and passing it a block as an argument.

`any?` iterates over all the elements in the calling collection and passes each to the block, where it is assigned to the block parameter `num`.

Within the block, we check to see if `num` is greater than `2`. This will return a Boolean `true` if the object referenced by `num` is greater than `2`, `false` otherwise. For example, on the first iteration, `num` references the integer `1` and so the expression returns `false`. On the third iteration, `num` references `3` so the expression will return `true`.

Because there is no more code to be evaluated within the block, this Boolean also becomes the return value of the block due to Ruby's implied return. `any?` uses the return value of the block, returning `true` if the block never returns a falsey value (`false` or `nil`) for all iterations, or `false` otherwise.

In this case, the block returns `true` on the third and final iteration, so `any?` returns `true`.

### 45

**Current time:** 5:35

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```

Here we are calling the `any?` method from the Enumerable module on the hash literal `{ a: "ant", b: "bear", c: "cat" }` and passing in a `do..end` block as an argument.

`any?` iterates over the key-value pairs in the calling hash, and passes each into the block. Because we are dealing with a hash, we have two block parameters. The key in the current iteration's key-value pair is assigned to the block parameter `key` and the value is assigned to the block parameter `value`.

Within the hash, we invoke the `size` method on the string object referenced by `value` and check to see if the return value is greater than `4`. This will return `true` if the string object referenced by `value` has more than four characters, or `false` otherwise.

In this case, none of the values in the calling hash have more than four characters, so the expression will return `false` on each iteration of the block.

Because there is no more code to be evaluated within the block, `false` also becomes the return value of the block. `any?` uses the return value of the block and evaluates it for truthiness. If the block ever returns a value that evaluates to true, `any?` will return true. In this case, the block always returns `false` and so the return value of the `any?` invocation will be `false`.

### 46

**Current time:** 3:48

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].all? do |num|
  num > 2
end
```

Here we are invoking the `all?` method from the Enumerable module on the array literal `[1, 2, 3]` and passing it a `do..end` block as an argument.

`all?` will iterate over the elements in the calling array and pass each into the block, where it is assigned to the block parameter `num`.

Within the block, we check to see if `num` is greater than `2`. This will return a Boolean, `true` if the integer referenced by `num` is greater than `2`, `false` otherwise. In this case, the first and second iterations will return `false` and the third iteration will return `true`.

Because there is no more code to be evaluated within the block, this Boolean becomes the return value of the block due to Ruby's implied return. `all?` uses the return value of the block, evaluating it for truthiness. `all?` will return `true` if the block never returns `false` or `nil`, `false` otherwise.

In this case, the block returns `false` on both the first and second iterations, so the `all?` invocation will return `false`.

### 47

**Current time:** 6:22

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

Here, we are invoking the `all?` method on the hash literal `{ a: "ant", b: "bear", c: "cat" }`, and passing it a block as an argument. Because the calling object is a hash, in this case we have two block parameters, `key` and `value`.

`all?` will iterate over the key-value pairs in the calling hash, and on each iteration will assign the current key object to the block parameter `key` as well as assign the current value object to the block parameter `value`.

Within the block, we invoke the `length` method on the string object referenced by `value`. This returns an integer representing the number of characters in the string object referenced by `value`. For example, on the first iteration, `value` references `"ant"` so `length` will return `3`. On the second iteration, `value` references `"bear"` so `length` will return `4`.

We then check to see if this integer is greater than or equal to `3`. This will return a Boolean either `true` or `false`. Because all the string values in the calling hash have at least three characters, in this case, the expression will return `true` on every iteration of the block.

Because there is no more code within the block to be evaluated, this becomes the return value of the block as well. `all?` uses the return value of the block, inspecting it for truthiness. `all?` will return `true` if the block never returns a `false` or `nil` value, `false` otherwise.

In this case, the block will always return `true`, so `all?` returns the Boolean `true`.

### 48

**Current time:** 5:46

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```

Here we are invoking the `each_with_index` method on the array literal `[1, 2, 3]` and passing it a block as an argument. `each_with_index` utilizes two block parameters, the first representing the current iterations' element from the calling collection, and the second representing the index number for that element.

In this case, `each_with_index` iterates over the array `[1, 2, 3]` and passes each element to the block where it is assigned to the block parameter `num`. The current index number is assigned to the block parameter `index`.

Within the block, we invoke the `puts` method and pass it the string `"The index of #{num} is #{index}."`. This uses string interpolation to output the integer objects referenced by `num` and `index` to the console as strings. This will output:

```ruby
"The index of 1 is 0."
"The index of 2 is 1."
"The index of 3 is 2"
```

`puts` always returns `nil`. Because there is no more code within the block to be evaluated, `nil` also becomes the return value of the block. `each_with_object`, however, ignores the return value of the block and always returns the calling collection. In this case, `each_with_object` will return `[1, 2, 3]`.

### 49

**Current time:** 11:23

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
```

Here, we are invoking `each_with_object` on the hash literal `{ a: "ant", b: "bear", c: "cat" }` and passing it an empty array object `[]` and a block as arguments.

`each_with_object` iterates over all the elements in the calling collection and passes them into the block. Here, the elements are key-value pairs which are converted to 2-element arrays and assigned to the block parameter `pair`. For example, on the first iteration, `pair` will reference the array object `[:a, "ant"]`, the second, `[:b, "bear"]`, etc.

`each_with_object` also passes the object that is passed to it as an argument into the block on each iteration. In this case, we have an empty array `[]`, which is assigned to the block parameter `array`.

Within the block, we call the `<<` method on the array referenced by `array`, and pass it the value returned by `pair.last` as an argument.

First, we must evaluated `pair.last`. This invokes the `last` method on the array referenced by `pair`, returning the last element in the calling array. On the first iteration it will return the string `"ant"`, on the second it will return the string `"bear"`, and on the third it will return the string `"cat"`.

This string, then, is passed to the `<<` method call as an argument. The `<<` method destructively modifies the calling array, by adding the string object passed to it to the array. `array`, then, will reference the array object `["ant"]` after the first iteration, `["ant", "bear"]` after the second iteration, and `["ant", "bear", "cat"]` after the third iteration. Because the reference to the collection object as a whole never changes, the collection object itself is mutated by each `<<` method call.

`<<` returns the calling object, modified. Because there is no more code to be evaluated within the block, this becomes the return value of the block as well. However, `each_with_object` ignores the return value of the block and always returns the original object that was passed to it as an argument. Because we have destructively modified this object via a mutating method, the return value of `each_with_object` is the array `["ant", "bear", "cat"]`.

### 50

**Current time:** 8:37

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```

Here, we are invoking the `each_with_object` method on the hash literal `{ a: "ant", b: "bear", c: "cat" }`, and passing it an empty hash `{}` and a block as arguments.

`each_with_object` will iterate over each key-value pair in the calling hash and pass it into the block, where the key object will be assigned to the block parameter `key` and the value object will be assigned to the block parameter `value`. The empty hash object is also passed into the block on each iteration, where it is assigned to the block parameter `hash`.

Within the block, we use the hash `[]=` method to create a new key-value pair in the hash referenced by `hash`. This is an instance of element assignment, which mutates the caller.

The key-value pairs that we are creating use the object referenced by `value` for the key, and the object referenced by `key` for the value. After the first iteration, therefore, `hash` will reference `{"ant" => :a}`. After the second iteration, `hash` will reference `{"ant" => :a, "bear" => :b}`. After the third iteration `hash` will reference `{"ant" => :a, "bear" => :b, "cat" => :c}`.

`[]=` always returns the object that it assigns as value, or in this case, the symbols `:a`, `:b`, `:c`. Because there is no more code to be evaluated within the block, this also becomes the return value of the block. `each_with_object`, however, does not use the return value of the block, and always returns the object that was passed to it.

In this case, it returns the object ``{"ant" => :a, "bear" => :b, "cat" => :c}`. We were able to modify the empty hash object passed as argument permanently by using element assignment on it within the block, which mutates the calling collection.

### 51

**Current time:** 8:00?

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd 
p even
```

First, we initialize the local variables `odd` and `even` and assign them to the value returned by invoking `partition` on the array literal `[1, 2, 3]`. We are able to use dual assignment here because `partition` returns a two dimensional array with two sub-arrays within. This is available through Ruby's syntactical sugar. The first sub-array in the return value will be assigned to `odd` and the second sub-array in the return value will be assigned to `even`.

When we invoke the `partition` method on the array `[1, 2, 3]` we pass it a block as an argument. `partition` will iterate over all the elements in the calling array, and pass each to the block, where it is assigned to the block parameter `num`.

Within the block, we invoke the `odd?` method on the integer referenced by `num`. This returns a Boolean, `true` if the integer is odd, false otherwise. In this case, it will return `true` on the first iteration, `false` on the second, and `true` on the third.

Because there is no more code within the block to be evaluated, these will also be the return values of the block on each iteration. `partition` uses the return value of the block, evaluating it for truthiness. `partition` returns a nested array that consists of two sub-arrays. The first sub-array is populated with those elements from the calling collection for which the block returns a truthy value. The second sub-array is populated with those elements from the calling collection for which the block returns `false` or `nil`.

In this case, `partition` will return the array `[[1, 3], [2]]`. Because we are using the dual assignment syntax available through Ruby's syntactical sugar, the array `[1, 3]` is assigned to the local variable `odd` and the array `[2]` is assigned to the local variable `even`.

When we pass `odd` to the `p` method, then, the array `[1, 3]` is output. When we pass `even` to the `p` method, the array `[2]` is output.

## Truthiness

### 53

**Current time:** 4:00

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

First we invoke local variable `a` and assign it to the string object `"Hello"`. Then we have a conditional `if...else` statement, where the value referenced by `a` is evaluated to either `true` or `false`.

If `a` evaluates to `true`, the code under the `if` statement is executed, and we output `"Hello is truthy"` via the `puts` method. Otherwise, if `a` evaluates the `false`, the code under the `else` statement is executed, and we output `"Hello is falsey"` via the `puts` method.

In this case, `a` references the string object `"Hello"`, which evaluates to `true`. `a`, therefore, references a _truthy_ object. This is because all object in Ruby evaluate to `true` except for `false` and `nil`.

Therefore, the code beneath the `if` statement is executed, and we see `"Hello is truthy"` output to the screen. This is an example of truthiness in Ruby.

### 54

**Current time:** 5:11

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end
```

First we initialize local variable `var` and assign it to the value returned by invoking the `test` method (defined above). Within the `test` method, we invoke the `puts` method and pass it the string `"written assessment"`. This string is output to the console, and `puts` returns `nil`.

Because there is no more code to be evaluated within the `test` method, this also becomes the return value of `test`. `nil`, therefore, is assigned to the local variable `var`.

Next we have an `if...else` conditional statement, where we evaluate the object referenced by `var` for truthiness. If `var` evaluates to `true`, the code under the `if` statement is run, and we invoke the `puts` method with the string `"written assessment"`, which will be output to the console. Otherwise, if `var` evaluates to `false`, the code under the `else` statement gets run, and we invoke the `puts` method with the string `"interview"`, which will be output to the console.

In this case, `var` references the object `nil`. `nil` is one of the few object in Ruby which evaluates to `false`. Therefore, the code under the `else` statement will get run, and we see `"interview"` output to the screen. `puts`, in this case, will also return `nil`. This is an example of a falsey value in Ruby.
