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
