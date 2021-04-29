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

**Current time:** 8:41

What does the following code return? What does it output? Why? What concept does it demonstrate?
