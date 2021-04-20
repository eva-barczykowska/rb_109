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
