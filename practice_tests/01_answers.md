# Practice Exam - Answers

## 1

First we initialize local variable `arr` and assign it the array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

Next, we invoke the `select` method on the object referenced by `arr`, and pass it a block as an argument. This creates an inner scope.

`select` will iterate through the block for each element in the calling array. On each iteration, the current element will be passed into the block and assigned to the block parameter `n`.

Within the block, we invoke the `odd?` method on the object referenced by `n`. This will return either `true` or `false` depending on whether the current integer array element is odd or even. Because this is the last line of code evaluated within the block, the block will return a Boolean, either `true` or `false`.

`select` will use this return value of the block to return a _new_ array object, containing only those elements from the original calling array for which the block returns `true`. This will result in the array `[1, 3, 5, 7, 9]` being returned.

## 2

First we initialize local variable `arr` and assign it the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

Next, we initialize local variable `new_array` and assign it to the value returned by the `map` method, which is invoked on local variable `arr` and passed a block as an argument. The block creates an inner scope.

`map` will iterate through the block for each element in the calling array. On each iteration, the current element will be passed into the block and assigned to the block parameter `n`.

Within the block, we check to see if `n` is greater than the integer `1`. This will return a Boolean `true` or `false` depending on whether the element `n` references on any given iteration is greater than `1`. For example, on the first iteration, this will return `false` and on the second iteration this will return `true`. Because this is the last line of code evaluated within the block, it will also be the return value of the block.

`map` uses the return value of the block that gets passed to it to perform transformation. It returns a _new_ array in which each element is the value returned by the block when each element from the calling collection is passed to it. Therefore, `map` will return `[false, true, true, true, true, true, true, true, true, true]`.

This array of Booleans is then assigned to the local variable `new_array`. When we pass the object referenced by `new_array` to the `p` method, it will output `[false, true, true, true, true, true, true, true, true, true]` to the console, and return the same array.

## 3

Here we invoke the `all?` method from the Enumerable module on a hash, `{ a: "ant", b: "bear", c: "cat" }`, and pass it a block, which creates an inner scope.

`all?` iterates through the calling hash, and passes each key-value pair to the block on each iteration. Because this is a hash, the block has two block parameters, `key` and `value`. The key of the current key value pair is assigned to `key` and the value of the current key-value pair is assigned to `value`.

Within the block, we call the string method `length` on the object referenced by `value`, which will return an integer, the amount of characters in the calling string.

We then check to see if this integer is greater than or equal to `3`. This will return a Boolean, either `true` or `false`. Because this is the last line of code evaluated within the block, it is also the return value of the block.

`all?` uses the return value of the block to determine if _all_ the elements within the original calling hash meet the criteria given within the block. It returns `true` if the block _never_ returns `false` or `nil`, and `false` otherwise.

In this case, the block will return `true` on each iteration through the calling hash, because all the hash value strings have at least 3 characters. Therefore, `all?` in this case will return `true`.

## 4

First, we invoke the `each_with_object` method on the hash literal `{ a: "ant", b: "bear", c: "cat" }`. `each_with_object` is passes an empty hash object `{}` as an argument, as well as a block. The block creates an inner scope.

Within the block, we have three block parameters. `each_with_object` will iterate through the calling hash, and pass each key-value pair to the block on each iteration, along with the empty hash object `{}` that was passed as an argument. The current key object will be assigned to the block parameter `key`, the current value object will be assigned to the block parameter `value` and the hash object passed as an argument will be assigned to the block parameter `hash`.

Within the block, we use the hash setter method `[]=` to create new key value pairs in the empty hash `hash` that was passed as an argument to `each_with_object`. This is an example of element assignment. In this case, the string referenced by `value` is made to be the new key in key-value pair we add to `hash`, and the symbol referenced by `'key'` is made to be the value. For example, on the first iteration, the block will add the key value pair `"ant" => :a` to the object referenced by `hash`.

`each_with_object` always returns the object that was passed to it as an argument. So the return value of the block is ignored, and the method returns the new hash `{"ant" => :a, "bear" => :b, "cat" => :c}`. The original calling hash is left unmodified.

## 5

First we initialize local variable `a` and assign it the array object `[1, 2, 3, 3]`. Then we initialize local variable `b` and assign it the object referenced by local variable `a`. At this point, both objects reference the same object in memory.

On line 3, we initialize local variable `c` and assign it the value returned by `uniq` when invoked on the object referenced by `a`. `uniq` returns a _new_ array object, in which all duplicated elements have been reduced to one instance. Therefore, `c` is assigned a new array object `[1, 2, 3]`.

Because `uniq` in this case returns a new object, the array referenced by `a` and `b` remains unchanged, which we can prove by passing both local variables to `puts`, outputting `[1, 2, 3, 3]` to the screen. `c` references a different object in memory.

If we had used the destructive method `uniq!`, however, this would not be the case. `uniq!` returns the same calling object, and mutates the caller. Therefore, the object referenced by `a` and `b` would be modified by it, and changed to `[1, 2, 3]`. This same object then, would be assigned to the local variable `c`, and all three local variables would reference the same object in memory.

We can see this by calling `object_id` on each, `a`, `b`, and `c`, which will return the same number (or object id) for all three.

## 6

First we initialize local variable `s` and assign it the string object `abc`. Then, we initialize the local variable `t` and assign it the value returned by the `fix` method, when passed the object referenced by `s` as an argument.

Invoking the `fix` method and passing the object referenced by `s` as an argument causes the string object `abc` to be passed into the method and assigned to the method parameter `value`. Now `value` and `s` both point to the same object in memory.

Within the method, we invoke the setter method `[1]=` on the object referenced by `value` and pass it the argument `x`. This causes the character at index 1 in the string `abc` to be reassigned to the character `x`. This is an example of element reassignment, which mutates the caller. Therefore, the string object referenced by both `value` and `s` is modified, and now has the value `'axc'`.

Next, we end the method with the object referenced by `value`, so this object `'axc'` also becomes the return value of the method `fix`. Therefore, this object is assigned to the variable `t`.

If we `puts` both variables `t` and `s` to the screen, we will see the output `'axc'` for each, proving that both local variables reference the same object in memory. This shows how Ruby can exemplify the behavior of pass by reference.

## 7

First we initialize local variable `a` to the string object `'hello'`. Then we invoke the `a_method` method (defined above) and pass it the object referenced by `a` as an argument.

Within the method, the string object `'hello'` is assigned to the method parameter `string`. Now both `string` and `a` reference the same object in memory.

We then call the concatenation method `<<` on the object referenced by `string` and pass it the string `' world'` as an argument. `<<` mutates the caller and returns the same object that called it, so here the modified string `'hello world'` is returned. The link between `a` and the object it referenced has not been broken, so `string` and `a` both still reference this object `'hello world'`.

Because there is no more code evaluated within the method, this string `'hello world'` is the return value of the method.

When we pass the object referenced by `a` to the `p` method, it will output the string `'hello world'` as modified by the mutating method `a_method`. `a_method` is a mutating method, because it contains a destructive method call within that returns the calling object; no new objects are created and no reassignment takes place.

This is an example of how Ruby can behave like a pass by reference language.

## 8

First we initialize local variable `s` and assign it the string object `'hello'`. Then we initialize local variable `t` and assign it the value returned by the `fix` method (defined above) when passed the object referenced by `s` as an argument.

When we invoke the `fix` method and pass it the object referenced by `s` as an argument, the string `'hello'` is passed into the method and assigned to the method parameter `value`. At this point, both `s` and `value` reference the same object in memory.

Within the method, we reassign `value` to the value returned by calling `upcase!` on the object referenced by `value`. Usually, reassignment would break the link between the variable and the object it previously referenced. However, in this case, because `upcase!` is a destructive method that returns the same object that called it, the same object is returned and reassigned to `value`. Therefore, `value` and `s` still point to the same object in memory. Because we have called the destructive method `upcase!` on this object, it now has the value `'HELLO'`.

Next, we call the destructive method `concat` on the object referenced by `value` (`'HELLO'`) and pass it the string `'!'` as an argument. This mutates the caller, appending the argument `!` to the calling string `'HELLO'`, and returns the same modified object, now `'HELLO!'`.

Because this is the last line of code evaluated within the method, it is also the return value of the method, so this string object will be assigned to the local variable `t`. Because it is still the same object referenced by `s`, both variables will now point to the same object in memory.

This can be shown by passing them to `puts`,

```ruby
puts t # => "HELLO!"
puts s # => "HELLO!"
```

This is an example of how Ruby can act like a pass by reference language with regards to mutating methods.

## 9

First we initialize local variable `a` and assign it the string object `"Hello"`. Then we initialize local variable `b` and assign it the object referenced by local variable `a`. At this point, both variables `a` and `b` will reference the same object in memory.

Next, we reassign local variable `a` to the string object `"Goodbye"`. This generates a new string object, and breaks the link between `a` and the object it previously referenced, `"Hello"`. `a` and `b` no longer reference the same object in memory.

`b`, however, still references the original string object `"Hello"`. This is demonstrated when we pass `a` to `puts`, which will output `"Goodbye"` and return `nil`. `b` is then passed to `puts`, which will output `"Hello"` and return `nil`.

## 10

First we initialize local variable `a` and assign it the string object `"hello"`.

Next, we invoke the `map` method on the array literal `[1, 2, 3]` and pass it a block as an argument. This creates an inner scope.

`map` iterates over all the elements in the calling array and passes each to the block. Within the block, the current element is assigned to the block parameter `num`. The block contains just the variable `a`, which returns `"hello"`, the object it references. The local variable `a` is accessible in inner scope because it was initialized in outer scope.

Because this is the last line of code evaluated by the block, it is also the return value of the block. `map` returns a new array, containing the return value of the block after passing each element in the calling collection to it. In this case, the block will always return `"hello"`. Therefore, `map` will return a three element array, `["hello", "hello", "hello"]`.

## 11

Here, we invoke the `each` method on the array literal `[1, 2, 3]`.

## 12

First we initialize the local variable `arr` and assign it to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Next, we initialize the local variable `incremented` and assign it to the value returned by invoking `map` on `arr`.

When we invoke `map` on the object referenced by `arr` we pass it a block as an argument, which creates an inner scope. `map` iterated over each element in the calling collection and passes it into the block, assigning the current iteration's element to the block parameter `n`.

Within the block, we add `1` to the object referenced by `n`. This returns a new integer, because integers are immutable objects, and cannot be changed. Because there is no more code evaluated within the block, the sum of the object referenced by `n` and `1` becomes the return value of the block.

`map` uses the return value of the block to perform transformation, returning a new array of the return value of the block for each value passed into it. Therefore, `map` here will return a new array of each element in the calling array increased by `1`: `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.

This new array object is then assigned to the local variable `incremented`. Therefore, when we pass `incremented` to `p` as an argument, it will output `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]` to the console.

The original array object referenced by `a` is unchanged.

## 13

First we initialize local variable `a` and assign it the integer object `4`.

Next, we invoke the `loop` method and pass it a block as an argument. This creates an inner scope.

Within the block, we reassign `a` to the integer `5`. This creates a new integer object in memory, and breaks the link between `a` and the object it previously referenced, `4`. `a` is accessible within the inner scope of the block because it was initialized in outer scope.

Next, we initialize local variable `b` and assign it the integer object `3`. Then, the `break` statement allows us to exit the loop.

Finally, we pass the object referenced by `a` to the `puts` method. This will output `5` and return `nil`. When we pass `b` to the `puts` method, it will result in a `NameError`. This is because `b` is a local variable initialized in inner scope, and therefore is not accessible in outer scope. Because the program throws an error before completing execution of `puts`, there is no return value.

## 14

First we initialize local variable `a` to the string object `'Bob'`.

Then, we invoke the `times` method on the integer `5`, and pass it a block as an argument. This creates an inner scope. The block has one block parameter, `x`, that is not used.

Within the block, we reassign `a` to the string object `'Bill'`. `a` is accessible within the inner scope of the block because it is a local variable that was initialized in outer scope.

Finally, we pass the object referenced by `a` to the `puts` method. Because `a` was reassigned within the block, `puts` will output the string `'Bill` and return `nil`. This shows how variables initialized in outer scope can be accessed and manipulated in inner scope, and these changes are visible when we pass into outer scope once again.

## 15

First we initialize local variable `y` to the string object `'a'`. Then we invoke the `increment` method (defined above) and pass it the object referenced by `y` as an argument.

Within the method, the object referenced by `y` is assigned to the method parameter `x`. Now both `x` and `y` point to the same object in memory.

Next, we invoke the `<<` method on the object referenced by the parameter `x` and pass it the string object `'b'` as an argument. `<<` is a destructive method that modifies and returns the calling object. Therefore, the string object referenced by both `x` and `y` is modified to `'ab'`. Because there is no more code within the method to be evaluated, this return value `'ab'` is also returned by the method.

Back outside the method, when we pass the object referenced by `y` to `puts`, it will output the string object `'ab'` and return `nil`. This is an example of how Ruby acts like a pass by reference language with respect to mutating methods.

## 16

First we initialize the local variable `arr1` and assign it the array object `["a", "b", "c"]`. Next, we initialize the local variable `arr2` and assign it the object returned by calling the `dup` method on the object referenced by `arr1`.

`dup` returns a shallow copy of `arr1`, which is then assigned to `arr2`. In a shallow copy, only the collection as a whole is copied into a new object. The elements within contain references to the same object in memory.

Next, we call the destructive `map!` method on the object referenced by `arr2`, and pass it a block as an argument. This creates an inner scope.

`map!` iterated over all the elements in the calling collection and passes each to the block. Within the block, the current iteration's element gets assigned to the block parameter `char`. We then call the `upcase` method on the object referenced by `char`. Because we use the non-destructive `upcase` method, a new string object is returned. `'A'` on the first iteration, `'B'` on the second, and so on.

Because there is no more code to be evaluated within the block, this is also the return value of the block. `map!` uses the return value of the block to perform transformation, changing each element in the calling collection to the value that is returned by the block on each iteration. This is a destructive action performed on the calling array, `arr2`, which is returned by the method as, `["A", "B", "C"]`.

Because the destructive method call was used on the collection as a _whole_, and not on the individual elements within, the array `arr1` that was copied remains unchanged. Therefore, when we pass the object referenced by `arr1` to `puts`, `["a", "b", "c"]` will be output (one element per line), and `nil` will be returned. When we pass `arr2` to `puts`, however, `["A", "B", "C"]` will be output (one element per line), and `nil` will be returned.

## 17

First we initialize local variable `arr` and assign it the array object `[1, 2, 3, 4]`. Then we initialize local variable `counter` and assign it the integer object `0`. Next, we initialize local variable `sum` and assign it the integer object `0`. Though both `counter` and `sum` reference `0`, these are two separate objects in memory, and can be modified individually.

Next, we invoke the `loop` method and pass it a block as an argument. This creates an inner scope. The local variables initialized in outer scope will be available within the inner scope created by the block.

Within the loop, we use the `+=` shorthand provided by Ruby's syntactical sugar to re-assign the local variable `sum`. Here, we are invoking the `+` method on the object referenced by `sum` and passing it the value referenced by `arr[counter]` as an argument. This return value will then get reassigned to `sum`.

`arr[counter]` represents element reference. Because we increment `counter` on the next line for each iteration of the loop, it will reference the current iterations element within the array `arr` for each iteration of the loop.

This incrementation process is done via the same mechanism as re-assigning `sum`, the shorthand `+=`. Namely, we call the `+` method on the object referenced by `counter` and pass `1` as an argument. This returns the value of `counter` + `1`, which then becomes the new value of `counter` (`counter = counter + 1`).

Therefore, on the first iteration of the loop, `sum` will be reassigned to `0 + 1`, on the second, `sum` will be reassigned to `1 + 2`, on the third, `sum` will be reassigned to `3 + 3`, etc. By the end of our iterations, `sum` should be equal to the sum of all the integer elements in the object referenced by `arr`.

Finally, we have a `break` statement with the condition that `counter` is equal to the size of the array `arr`. This is checked via the equality operator `==`. Once `counter`is equal to the size of the array referenced by `arr`, which will happen on the fourth iteration of the loop, the condition will return `true` and we break out of the loop.

Last, we invoke the `puts` method and pass it the string `"Your total is #{sum}"`. This uses string interpolation to output the value `sum` (which is equal to the sum of all elements within the array `arr`) to the console as a string.

`puts` prints `"Your total is 10"` to the console and returns `nil`.

## 18

First we initialize local variable `arr` and assign it the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Then, we initialize the local variable `new_arr` and assign it to the value returned by calling the `select` method on the object referenced by `arr`.

When we call `select` on the object referenced by `arr`, we pass it a block as an argument. This creates an inner scope.

`select` will iterate over all the elements in the calling array, `arr`, and pass each into the block. Within the block, the current iteration's element will get assigned to the block parameter `n`.

Within the block, we call the `+` method on the object referenced by `n` and pass it the argument `1`. This will return an integer equal to `n + 1`. Because there is no more code to be evaluated within the block, this will also be the return value of the block.

`select` uses the return value of the block to perform selection. It returns a new array of those elements from within the calling array (`arr`) for which the block returns a truthy value. In Ruby, all objects except `false` and `nil` are considered truthy.

In this case, the block will always return an integer. All integers are considered to be truthy values. Therefore, `select` will return a new collection with all elements from the original `arr` array selected. Namely, the array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

This array will then be assigned to the local variable `new_array`. Therefore, when we pass the object referenced by `new_array` to `p`, `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` will be printed on the console.

## 19

Here we invoke the `any?` method from the Enumerable module on the array literal `[1, 2, 3]`, and pass it a block as an argument.

`any?` iterates over all the elements in the calling array and passes each to the block, where it assign's the current iteration's element to the block parameter `num`. Within the block, we check to see if `num` is greater than `2`. This will return `false` for the first iteration, `false` for the second iteration, and `true` for the third.

Because there is no more code to be evaluated within the block, this becomes the return value of the block as well. `any?` is a method that checks the return value of the block for truthiness, it will return `true` if the block _ever_ returns a truthy value (something other than `false` or `nil`).

In this case, the block returns `true` on the third iteration. `any?` will therefore return `true`.

## 20

First we initialize local variable `s` and assign it the string object `'hello'`. Then we initialize local variable `t` and assign it the value returned by the `fix` method (defined above) when passed the object referenced by `s` as an argument.

When we invoke the `fix` method and pass it the object referenced by `s` as an argument, the string `'hello'` is passed into the method and assigned to the method parameter `value`. At this point, both `s` and `value` reference the same object in memory.

Within the method, we reassign `value` to the value returned by calling `upcase!` on the object referenced by `value`. Usually, reassignment would break the link between the variable and the object it previously referenced. However, in this case, because `upcase!` is a destructive method that returns the same object that called it, the same object is returned and reassigned to `value`. Therefore, `value` and `s` still point to the same object in memory. Because we have called the destructive method `upcase!` on this object, it now has the value `'HELLO'`.

Next, we call the destructive method `concat` on the object referenced by `value` (`'HELLO'`) and pass it the string `'!'` as an argument. This mutates the caller, appending the argument `!` to the calling string `'HELLO'`, and returns the same modified object, now `'HELLO!'`.

Because this is the last line of code evaluated within the method, it is also the return value of the method, so this string object will be assigned to the local variable `t`. Because it is still the same object referenced by `s`, both variables will now point to the same object in memory.

This can be shown by passing them to `puts`,

```ruby
puts t # => "HELLO!"
puts s # => "HELLO!"
```

This is an example of how Ruby can act like a pass by reference language with regards to mutating methods.

## 21

First we initialize local variable `a` to the integer object `4`. Then we initialize local variable `b` to the integer object `2`.

Next, we invoke the `loop` method and pass it a block as an argument. This creates an inner scope within the block.

Within the block, we initialize the local variable `c` to the integer object `3`. Next, we reassign local variable `a` to the object referenced by `c`. Now both variables `a` and `c` reference the same object in memory, the integer `3`. `a` is available in the inner scope as it is a local variable initialized in outer scope. Then we break out of the loop.

Finally, we invoke `puts` and pass it the object referenced by `a` as an argument. `a` still references the integer `3`, which is output to the screen. We can access this object through `a`, because `a` was initialized in outer scope. `puts` returns `nil`. This is an example of local variable scope.

When we pass `b` to `puts`, the integer `2` is output, and `puts` returns `nil`.

## 22

First we initialize local variable `a` and assign it the array object `["a", "b", "c"]`.

Next, we use the array setter method `[]=` to perform element reassignment. In this case, we reassign the element at `a` index 1 from `"b"` to `"-"`. Element assignment is mutating, and will destructively modify the collection.

Therefore, when we pass `a` to the `p` method, `p` will output the array `["a", "-", "c"]`.

## 23

First we initialize the local variable `names` and assign it the array object `['bob', 'kim']`. Next we invoke the `add_name` method (defined above) and pass it the object referenced by `names` (an array) and the string literal `'jim'` as arguments.

Within the method, the array referenced by `names` (`['bob', 'kim']`) is assigned to the method parameter `arr`. The string literal `jim` is assigned to the method parameter `name`.

Then, we reassign `arr` to the value returned by `arr + [name]`. Here we are invoking the array `+` method and passing it the object referenced by `name` as a string element within in an array as an argument (`['jim']`). The `+` method is _not_ a destructive method and returns a _new_ array object that contains all elements from both the calling array (`['bob', 'kim']`) and the argument array (`['jim']`). Therefore, it will return the new array object `['bob', 'kim', 'jim']`.

The new array `['bob', 'kim', 'jim']` is then assigned to the method parameter `arr`. However, reassignment breaks the link between the variable being reassigned and the object it previously referenced. Therefore, `arr` now references the array `['bob', 'kim', 'jim']`, but `names` outside the method still references the original unmodified array `['bob', 'kim']`.

When we pass `names` to `puts`, the original array `['bob', 'kim']` will be output and `nil` will be returned.

To fix this, we can either use a mutating method within `add_name` (such as `<<`), or reassign the return value of `add_name` to the local variable `name` (`names = add_name(names, 'jim')`).
