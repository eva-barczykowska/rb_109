# Methods

- [What is a method?](#what-is-a-method)
- [Method Definitions](#method-definitions)
- [Method Invocation](#method-invocation)
- [Arguments vs Parameters](#arguments-vs-parameters)

## What is a method?

A method is a discreet piece of code that generally describes a single procedure. Methods consist of two things: a **method definition** and a **method invocation**.

```ruby
# method definition
def some_method
  "I live inside a method!"
end

# method invocation
some_method
```

## Method Definitions

A method definition starts with the keyword `def` and ends with the keyword `end`. The code within describes the steps the method will take to accomplish it's purpose.

In general, there are a few different kinds of methods.

Some methods we use for their [return value](./return_values.md), for example:

```ruby
def adds_two(num1, num2)
  num1 + num2               # returns the sum of two numbers
end
```

Others we use for their _side-effects_, such as outputing something to the console or modifying an object.

```ruby
# outputs the `message` passed in as an argument, returns `nil`
def display_message(message)
  puts message
end

# modifies a string object
def add_an_s!(string)
  string << 's'
end
```

Still others can determine something about an object by returning a boolean.

```ruby
def odd_num?(num)
  num % 2 == 1
end
# returns `true` if num is odd, `false` otherwise
```

## Method Invocation

Method invocation is when we **call** a method on some object. Until we call a method, none of the code within it's definition gets run.

```ruby
def a_method
  puts "The method has been called!"
end
```

The code above does not execute, nothing is output to the screen.

```ruby
def a_method
  puts "The method has been called!"
end

a_method
# outputs => "The method has been called!" returns nil
```

The code above contains a method call, which runs the code within the method definition, so the `puts` invocation outputs the string `"The method has been called!"`.

## Arguments vs Parameters

Some methods take arguments. **Arguments** describe the actual objects that get passed to the method when it is invoked. These objects then get assigned to **parameters**, which are defined in the method definition.

```ruby
def display_message(message)    # message = parameter
  puts message
end

display_message("hi there")     # "hi there" = argument
# => outputs "hi there"
# => returns `nil`
```

You can set a **default value** for any given parameter using the following syntax:

```ruby
def display_message(message= "hi")
  puts message
end

display_message           # => 'hi'
display_message 'HELLO!'  # => 'HELLO!'
```
