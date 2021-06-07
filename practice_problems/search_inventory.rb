=begin
# Problem:
  - Create a method that searches though the given inventory data structure and returns those items that match the search speciifications given as an argument.
  
- Input: a hash containing 3 key-value pairs
  - price_min, value is an integer representing the minimum price for items to be returned
  - price_max, value is an integer representing the maximum price for the items to be returned
  - both limits are inclusive (examples)
  - a key word, q:, should be included in the name of any items returned
- Output: an array of hashes containing only those items that match the given search parameters
  - The array contains hash elements, each of which represents a given item from the inventory
  - Each hash contains a name value and a price value, both of which should match the given search criteria

- Does it return the array collection or output it? 

# Algorithm:
  - Initialize a range from given min to max, inclusive
  - Select those elements from PRODUCTS that:
    - have a price included in the given range
    - have a name that includes the given search query (case insensitive)
  
=end


PRODUCTS = [
  { name: "Thinkpad x210", price: 220},
  { name: "Thinkpad x220", price: 250},
  { name: "Thinkpad x250", price: 979},
  { name: "Thinkpad x230", price: 300},
  { name: "Thinkpad x230", price: 330},
  { name: "Thinkpad x230", price: 350},
  { name: "Thinkpad x240", price: 700},
  { name: "Macbook Leopard", price: 300},
  { name: "Macbook Air", price: 700},
  { name: "Macbook Pro", price: 600},
  { name: "Macbook", price: 1449},
  { name: "Dell Latitude", price: 200},
  { name: "Dell Latitude", price: 650},
  { name: "Dell Inspiron", price: 300},
  { name: "Dell Inspiron", price: 450}
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(query)
  price_range = (query[:price_min]..query[:price_max])
  
  PRODUCTS.select do |product|
    price_range.cover?(product[:price]) && product[:name].downcase.include?(query[:q])
  end
end

p search(query) == [ { name: "Thinkpad x220", price: 250} ]
p search(query2) == [ { name: "Dell Inspiron", price: 300}, { name: "Dell Inspiron", price: 450} ]
