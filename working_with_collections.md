# Ruby Collections

## What is a collection?

A collection is a Ruby object or data structure that is made up on individual elements. Collections include Strings, Arrays, and Hashes, among other things.

## Element Reference

**Element reference** refers to thee way we can reference, and therefore manipulate, individual elements within a collection.

### String Element Reference

Each individual character in a string can be referenced using an _integer based index number_. The first character in a string is said to be at `index 0`. Each subsequent character has an index that is increased by `1`.

We can use the `String#[]` or `String#slice` methods to isolate individual elements, of groups of elements.

```ruby
string = '01234'
string[0]         # => '0'
string[1]         # => '1'
string[2]         # => '2' ... etc

s = 'Hello World'
s[0]              # => 'H'
s[2]              # => 'l'
s[-1]             # => 'd'
s[2, 3]           # => 'llo'; starts at index 2, returns 3 chars
s[2, 3][2]        # => 'o'; returns char at index 2 in substring returned by s[2, 3]
```

### Array Element Reference

Arrays also use an _integer based index number_ to reference each element within the collection. Similarly to strings, we can use `Array#[]` or `Array#slice` methods to access individual elements or sub-groups of elements.

```ruby
arr = %w(a b c d e f g)
arr[0]          # => 'a'
arr[1]          # => 'b'
arr [-1]        # => 'g'
arr[2, 3]       # => ['c', 'd', 'e']; starts at index 2, returns 3 elements
arr[2, 3][2]    # => 'c'; returns element at index 2 in subarray returned by arr[2, 3]
```

Note that the bracket notation above is equivalent to the `slice` method.

```ruby
arr = %w(a b c d e f g)
arr.slice(3, 1)  # => ['d']
arr.slice(3..3)  # => ['d']
arr.slice(3)     # => 'd'
```

### Hash Element Reference

Hashes are data structures that use _key-value pairs_ to order objects instead of an integer based index. Either the key or the value in a hash can be any type of Ruby object. Each key in a hash must be unique, but values can be duplicated.

We can access a particular value by using it's associated key with `Hash#[]`.

```ruby
hash = { one: 1, two: 2, three: 3 }
hash[:one]      # => 1
hash[:two]      # => 2

hsh = { 1 => 'one', 2 => 'two' }
hash[2][2]      # => 'o'; returns the character at index 2 in the string returned by hash[2]
```

Use the `Hash#keys` method to return an array containing all the keys in the calling hash. Use the `Hash#values` method to return an array containing all the values in the calling hash. Each individual key and value, then, can be accessed via it's index within the array.

```ruby
hash = { one: 'son', two: 'shoe', three: 'free' }
hash.keys     # => [:one, :two, :three]
hash.values   # => ['son', 'shoe', 'free']
```

### Element Reference Tricks

#### Out of Bounds

In both strings and arrays, if you try to reference and index that is _out of bounds_ (i.e. it is bigger or smaller than the collection object itself), it will return `nil`.

```ruby
string = "Hello"
string[5]       # => nil
string[-6]      # => nil

array = [1, 2, 3]
array[3]        # => nil
array[-4]       # => nil
```

When dealing with strings, this error is pretty obvious, since we know that each referenced element has to be some kind of character, which `nil` is not.

In arrays, however, `nil` is a valid value for an array element. So, it is impossible to tell if you are getting a `nil` result from being out of bounds or if you are simply retrieving `nil` as a valid array element. In this case, it's better to use `Array#fetch` which will through an `IndexError` if the index is out of bounds instead of just returning `nil`.

```ruby
arr = ["one", :two, 3, nil]
arr[4]          # => nil (out of bounds index provided)
arr[3]          # => nil (value at array index 3)

arr.fetch(3)    # => nil
arr.fetch(4)    # => IndexError
```

#### Negative Indices

Elements in both strings and arrays can be referenced using negative index numbers as well. When using negative index numbers, `-1` starts at the last element in the collection and counts backwards.

```ruby
array = [0, 1, 2, 3, 4]
array[-1]       # => 4
array[-2]       # => 3
array[2..-1]    # => [2, 3, 4]
```

#### Invalid Hash Keys

If the key used with `Hash#[]` does not exist in the calling hash, the method will return `nil`. Like with arrays, `nil` is a valid hash value, so there is no way to tell if you are accessing a non-existant hash key or returning a valid `nil` value. Use `Hash#fetch` to distinguish between these results, which will throw a `KeyError` if the given key is not found.

```ruby
hsh = {one: 'son', two: 'shoe', infinity: nil }
hsh[:one]       # => 'son'
hsh[:three]     # => nil (no such key)
hsh[:infinity]  # => nil (valid hsh value)

hsh.fetch(:infinity)  # => nil
hsh.fetch(:three)     # => KeyError
```

## Conversion

Strings and arrays are structured similarly (zero-based index) so it's easy to convert between the two.

- `String#chars` returns an array in which each element in a single character from the calling string.
- `Array#join` returns a string with the elements of the array joined together. You can pass it a _delimiter_ which will be input between each element in the calling array once it is converted to a string.
- `String#split` is a good choice when you want to convert a string into an array of individual sub-strings rather than single characters. You pass it the character(s) to split along as an argument, and this will not be included in the resulting sub-string elements. The default is a `' '`.

You can also convert between hashes and arrays, but you need to be aware of the structural necessities to do so.

- `Hash#to_a` returns a two-dimensional array in which each sub-array has two elements; each key-value pair from the calling hash.
- `Array#to_h` is usually invoked by a two-dimensional array in which each sub-array has two elements, and returns a hash in which each sub-array's elements are the collection's key-value pairs. If you need to convert an array of a different data structure to a hash, you can pass this method a block which returns a two-element array, and these elements will form the key-value pairs in the new hash.

## Element Assignment

Change individual element values within a collection by combining the assignment operator with element reference. Note that this is _a destructive action_ that permanently modifies the collection (see [Indexed Assignment](mutating_methods_object_passing.md#indexed-assignment)).

- To change the value of a specific character within a string, use `String#[]` combined with the assignment operator.

  ```ruby
  string = "Fix my tupo!"
  string[8] = 'y'
  puts string       # => "Fix my typo!"
  ```

- Use `Array#[]` to change the value of a specific element within the array. You can also use any of the abbreviated assignment operators (syntactical sugar) to manipulate certain types of data.

  ```ruby
  array = [1, 2, 4, 4, 5, 6]
  array[2] -= 1
  p array           # => [1, 2, 3, 4, 5, 6]
  ```

- Use `Hash#[]` with the desired key to change a corresponding value.

  ```ruby
  hsh = { orchid: 'plant', rosemary: 'plant' }
  hsh[:orchid] = 'flower'
  hsh[:rosemary] = 'herb'
  p hsh             # => {orchid: 'flower', rosemary: 'herb' }
  ```

## Iteration

### Basic Looping

You can use a basic loop (with `Kernal#loop`) to iterate over the elements in a collection. There are four elements required for such a construct:

1. **Loop**: block of code that gets repeated (note that when passed to `Kernal#loop` this creates an [inner scope](variable_scope.md#scopes-with-a-block)).
2. **Counter**: variable that tracks the number of iterations
3. Some way to **retrieve* the current value (current element in the collection)
4. Some way to exit the loop (such as a `break` statement)

```ruby
array = ['one', 'two', 'three', 'four']
counter = 0

loop do
  puts array[counter]
  counter+= 1
  break if counter >= array.length
end

# => 'one'
# => 'two' ... etc
```

The iteration counter is often used to represent index, since they both start at 0 and are incremented by 1 each time through the loop. In this case, the length of the collection will represent an index that is out of bounds, so make sure to break out of the loop before that is reached.

### Iterating over Hashes

Hashes have key-value pairs, rather than indexes, so a simple counter variable can't be used to iterate over the hash. Instead, create an array containing all the keys in the hash (`Hash#keys`). Then, iterate over the array of keys, and save each key into a variable. Finally, use that variable to retrieve the appropriate value of the hash.

```ruby
books_in_stock = {
  'sci-fi' => 125,
  'romance' => 156,
  'literature' => 231
}

books = books_in_stock.keys
counter = 0

loop do
  break if counter >= books_in_stock.length
  current_book = books[counter]
  current_book_quantity = books_in_stick[current_book]
  puts "The store has #{current_book_quantity} #{current_book} books."
  counter += 1
end
```

## Selection and Transformation

Selection and transformation are both processes that add a _set of rules_ to the four basic elements of looping. **Selection** uses these rules to determine _which elements_ are selected. **Transformation** uses the rules to determine _how_ to transform each element.

### Selection

Selection describes the process of picking certain elements out of a collection based on some condition or expression that evaluates to a Boolean value.

For example, the code below _selects_ elements from the original array and adds them to a new array based on the conditional (is the element even?), returning a new array consisting of the sub-set of elements that are even.

```ruby
array = [1, 2, 3, 4, 5, 6, 7]
counter = 0
evens = []

loop do
  break if counter >= array.length
  if array[counter].even?
    evens << array[counter]
  end
  counter += 1
end

p array   # => [1, 2, 3, 4, 5, 6, 7]
p evens   # => [2, 4, 6]
```

### Transformation

Transformation describes the process of manipulating each element in the collection, and using some evaluated expression to transform each element. Unless the process is stopped early, it will return the same amount of elements in the original collection. It is considered bad practice to modify the length of a collection during transformation.

The code below _destructively_ transformed an array by iterating through and adding 1 to each element by using [element assignment](#element-assignment).

```ruby
array = [1, 2, 3, 4, 5, 6, 7]
counter = 0

loop do
  break if counter >= array.length
  array[counter] += 1
  counter += 1
end

array   # => [2, 3, 4, 5, 6, 7, 8]
```

When performing transformation be aware of what's returned. Is it a new collection of transformed values or has the original collection been mutated?

### Extracting to Methods

Both selection and transformation are _specific actions_ that lend themselves to being separated into a discreet method. Hence the previous language of _returning_ a new or the original collection based on the rules of the method itself.

Because of Ruby's implied return, end methods with what you want the return values to me.

Methods can contain criteria for _both_ transformation and selection, in which case they will only transform a _subset_ of elements in the collection being manipulated.

Make these methods as generic as possible by allowing for additional parameters to specify some criteria for selection or transformation.

```ruby
# not a very generic method, returns new array
def adds_one(numbers)
  counter = 0
  added_numbers = []

  loop do
    break if counter >= numbers.length
    added_numbers << numbers[counter] + 1
    counter += 1
  end

  added_numbers
end

# more generic, you can choose what to add
def adds(numbers, to_add)
  counter = 0
  added_numbers = []

  loop do
    break if counter >= numbers.length
    added_numbers << numbers[counter] + to_add
    counter += 1
  end

  added_numbers
end
```

In general, don't hard code what you don't have to. Using a descriptive variable makes code easier to read as well as more versatile in the long run.
