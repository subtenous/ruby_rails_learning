# Notes for Ruby 

Very brief notes of ruby learning that I find useful to write down

# Basic Data Types

Ruby uses familiar basic data types: strings, integers, floats. Fairly similar to Python overall.

Ruby has typical operators

To obtain accurate answers in arithmetic one of the numbers must be a float 

```ruby 
17 / 5.0 #=> 3.4
```
## Converting number types

Convert integer to a float
```ruby 
13.to_f #=> 13.0
```
## Strings

String Interpolation

```ruby
name = "Odin"

puts "Hello, #{name}" #=> "Hello, Odin"
```
## Symbols

symbols start with a colon and are often used as labels or identifiers

```ruby
:my_symbol
:name
:email
```

Symbols are immutable and reused in memory, unlike strings which create new objects

# Variables

Variables are similar to Python, Ruby does not require keywords 

# Input and Output
played around with this in irb

print vs puts
- print keeps everything on one line including the argument passed in
- puts places the argument on a new line

```ruby
irb(main):001:0> print "Hello World"; print "I love drinking coffee"
Hello WorldI love drinking coffee=> nil
```
irb(main):002:0> puts "Hello World"; puts "I love drinking coffee"
Hello World
I love drinking coffee
=> nil

".chomp" removes the newline freom the end of user input

```ruby
name = gets.chomp  
```
# Conditional Logic

<=> (spaceship operator) returns the following:

- -1 if the value on the left is less than the value on the right;
- 0 if the value on the left is equal to the value on the right; and
- 1 if the value on the left is greater than the value on the right.

Useful stuff

- case statements 
- unless statements = opposite of if statements
- ternary operator

# Loops



"loop" just simply loops until the break command is used

while loops are familiar

until loop runs as long as the condition is false -  can make loops more readable if negation has to be used 

## Ranges

```ruby 
(1..5)      # inclusive range: 1, 2, 3, 4, 5
(1...5)     # exclusive range: 1, 2, 3, 4
```
upto and downto loops 

```ruby 
5.upto(10) do |num| 
    print "#{num}"
end
```
# Arrays

- arrays can additionally be created aside from [] using Array.new method with 2 optional arguments initial size and default value
- also uses first and last methods as well as indexing. Can retrieve first n elements of an array using .first(n)
- adding an element to end of array with << or #push, Can use #pop to pop the last element and return it 
- unshift does the same as #push but to beginning of array and same for shift with #pop
- adding and subtracting arrays is simple
- Some methods change the original array, such as `push`, `pop`, `shift`, `unshift`, and `concat`.

# Hashes

- same as dictionaries in Python
- hash formatting
```ruby
my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {}
}
```
- as well as {}, Hash.new can also be used to create a hash 
- .fetch method can be used to raise an error if a key is not in the hash
- can also be used to return a default value instead of raising an error if the given key is not found
- .delete is used for deleting data from a hash. Also returns the key-value pair that was deleted which is useful 
- #keys and #values methods return the keys and values respectively
- can use .merge to simply merge 2 hashes
- symbols are usually used for hashes. They allow for a much cleaner syntax when defining hashes
```ruby
# 'Rocket' syntax
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}
# 'Symbols' syntax
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}
```
- ^ this only works for symbols
- Both syntaxes create symbol keys that are accessed in the same way with the colon on the left:
```ruby
american_cars[:ford]    #=> "Mustang"
japanese_cars[:honda]   #=> "Accord"
```

# Methods

- Functions in Python
- Ruby has many built in methods
- simple method with parameter
```ruby
def greet(name)
  "Hello, " + name + "!"
end

puts greet("John") #=> Hello, John!
```
- Default parameter
```ruby
def greet(name = "stranger")
  "Hello, " + name + "!"
end

puts greet("Jane") #=> Hello, Jane!
puts greet #=> Hello, stranger!
```
- Ruby doesn't always use return it just returns the last expression that was evaluated within the method
- return can be used to tell Ruby explicitly which expression to return-
- example use case of an explicit return statement
```ruby
def even_odd(number)
  unless number.is_a? Numeric
    return "A number was not entered."
  end

  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(20) #=>  That is an even number.
puts even_odd("Ruby") #=>  A number was not entered.
```

- methods can easily be chained like this:
```ruby
phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" ").capitalize
#=> "To be or not to be"
```
- Built in Ruby methods that have a question mark at the end of their name are called predicate methods
- They return a boolean
- bang methods. Some methods such as downcase, don't modify the original value of an object. 
- If ! is added to the end of the method, downcase!, it overwrites the original value of the object wiht the result 

```ruby 
whisper = "HELLO EVERYBODY"

puts whisper.downcase #=> "hello everybody"
puts whisper #=> "HELLO EVERYBODY"

puts whisper.downcase! #=> "hello everybody"
puts whisper #=> "hello everybody"

```

# Debugging

-using pry-byebug for debugging line by line