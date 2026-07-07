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

# Basic Enumerable Methods

## Select

A loop without enumerable methods
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

for friend in friends do
  if friend != 'Brian'
  invited_list.push(friend)
  end
end

invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]
```
- Using the #select enumerable method
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }
 #=> ["Sharon", "Leo", "Leila", "Arun"]
```
- Or even better
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.reject { |friend| friend == 'Brian' }
 #=> ["Sharon", "Leo", "Leila", "Arun"]
```

## Each

Using #each 

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| puts "Hello, " + friend }
```

do...end can be used instead of {...} for logic that requires multiple lines

```ruby
my_array = [1, 2]

my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end

#=> The new number is 2.
#=> The new number is 4.

#=> [1, 2] 
```

each also works for hashes, depending on how the block variable is defined each iteration will either yeild both the key and value individually or together (as an array)

```ruby 
my_hash = { "one" => 1, "two" => 2 }

my_hash.each { |key, value| puts "#{key} is #{value}" }

#=> one is 1
#=> two is 2
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{pair}" }

#=> the pair is ["one", 1]
#=> the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}
```

## Each_with_index

This uses two block variables instead of one as it iterates through. 
The first variable being the element itself while the second value is the element itself
This allows some slightly more complex things to be done

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]

```

## Map

- Using map over each can make some things a lot more efficient

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
```

Trying to do that with each would require more unnecessary code

Another example
```ruby 
salaries = [1200, 1500, 1100, 1800]

salaries.map { |salary| salary - 700 }
#=> [500, 800, 400, 1100]
```

## Select

```ruby
responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}
```

## Reduce

```ruby
my_numbers = [5, 6, 7, 8]

my_numbers.reduce { |sum, number| sum + number }
#=> 26
```

Slightly more complex example of using #reduce
```ruby
votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}
```

## Bang methods

Methods like map and select can become map! and select! instead of returning a new array they modify the original array.

## Return values of enumerables

Wrapping a enumerable method in a method definition is a good option for returning values of enumerables

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

def invited_friends(friends)
  friends.select { |friend| friend != 'Brian' }
end

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends(friends)
 #=> ["Sharon", "Leo", "Leila", "Arun"]
```

# Predicate Enumerable Methods

## include?

Very simple method which can massively cut down on lines of code

```ruby
numbers = [5, 6, 7, 8]

numbers.include?(6)
#=> true

numbers.include?(3)
#=> false
```

## any?

returns true if any elements in the array match the condition within the block; otherwise, it will return false

```ruby
numbers = [21, 42, 303, 499, 550, 811]

numbers.any? { |number| number > 500 }
#=> true

numbers.any? { |number| number < 20 }
#=> false
```

## all?

returns true if all the elements in the array match the condition within the block; otherwise, it will return false

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 }
#=> true

fruits.all? { |fruit| fruit.length > 6 }
#=> false
```

## none?

returns true if none if the elements in the array match the condition within the block

## one?

returns true if one if the elements in the array match the condition within the block

# Nested collections

- Nested arrays are simply just arrays within arrays 
- Acessing them can be done through indexing, where the first value is the index of the nested element and the second is the index inside of the nested element

- mutable and immutable nested arrays can be created 
- in the first example changing the value in the first nested array causes the first element to change in all three nested arrays.
```ruby
mutable = Array.new(3, Array.new(2))
#=> [[nil, nil], [nil, nil], [nil, nil]]
mutable[0][0] = 1000
#=> 1000
mutable
#=> [[1000, nil], [1000, nil], [1000, nil]]
```

- In this example all three inner arrays are independent objects. When one is modified, the others stay the same.

```ruby
nested_arrays = Array.new(3) { Array.new(2) }
#=> [[nil, nil], [nil, nil], [nil, nil]]
nested_arrays[0][0] = 1000
#=> 1000
nested_arrays
#=> [[1000, nil], [nil, nil], [nil, nil]]
```

## Adding and removing elements

Push and shovel operator can be used to add, same goes for pop. Use indexing to choose which nested array to push or pop to or from

```ruby
test_scores << [100, 99, 98, 97]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
test_scores[0].push(100)
#=> [97, 76, 79, 93, 100]
test_scores
#=> [[97, 76, 79, 93, 100], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]

```

## Iterating over a nested array

This iterates each nested array
```ruby
teacher_mailboxes.each_with_index do |row, row_index|
  puts "Row:#{row_index} = #{row}"
end
#=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
#=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
#=> Row:2 = ["Perez", "Scott", "Smith", "Young"]
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]

```

Using nested enumerable methods to loop over elements inside of each nested array
```ruby
teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
  end
end
#=> Row:0 Column:0 = Adams
#=> Row:0 Column:1 = Baker
#=> Row:0 Column:2 = Clark
#=> Row:0 Column:3 = Davis
#=> Row:1 Column:0 = Jones
#=> Row:1 Column:1 = Lewis
#=> Row:1 Column:2 = Lopez
#=> Row:1 Column:3 = Moore
#=> Row:2 Column:0 = Perez
#=> Row:2 Column:1 = Scott
#=> Row:2 Column:2 = Smith
#=> Row:2 Column:3 = Young
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]

```

.flatten can be used to flatten a nested array into a single array for more simple looping

Example of nesting two predicate enumerables together. This code determines if any students score higher than 80 on everything
```ruby
test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
end
#=> false

```

## Caesar Cipher

I first wrote a basic working version using conditionals and ASCII values with `.ord` and `.chr`.

The first version handled:
- lowercase letters
- uppercase letters
- punctuation/spaces
- simple wraparound from z to a

## Caesar Cipher Refactor

I then refactored it using modulo `% 26`, `map`, and `join`.

The refactored version uses a base ASCII value:

```ruby
base = "a".ord
```
# Object Oriented Programming in Ruby

### Encapsulation
Encapsulation is one of the fundamental conceps of OOP. It describes teh idea of bundling or combining the data and the operations that work on that data into single entity, e.g., an object.

### Polymorphism
Polymorphism is the ability for different types of data to respond to a common interface. Simply put different classes could share behaviours like move, a class could be anything from a person to a car that can move.

### Inheritance
All quite familiar but inheritance inherits from another class. For example plant could be a superclass where different types of plants are sub classes that inherit methods from the superclass.

### Objects
Objects are instances of a class that contain different information from each other.

```ruby
class GoodDog
end

sparky = GoodDog.new
```

### Modules
```ruby
module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")        # => Arf!
bob = HumanBeing.new
bob.speak("Hello!")         # => Hello!
```

### States and Behaviours
- State referes to the data associated to an individual object, instance variables
- Behaviours are what objects are capable of doing (methods)
- Objects may contain different info such as name, weight and height whihc are tracked with instance variables.
- The bahviours are things like bark, run, fetch. 

### Initialising and new object

Constructor method

```ruby
class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new        # => "This object was initialized!"
```
### Instance Variables

@name is the instance variable

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
```
### Compostition

The lifetimes of the container and composed objects are dependent on each other. Car has an engine, and car instances contain an engine object. When the car is instantiated the engine is also instantiated. Likewise. when the car object is destroyed, the composed engine object is also destroyed.

```ruby
class Engine
  def start
    puts "Engine starting..."
  end
end

class Car
  def initialize
    @engine = Engine.new  # Engine instance is created when Car is created
  end

  def start
    @engine.start
  end
end

my_car = Car.new
my_car.start  # Engine is an integral part of Car
```

### Aggregation

Unlike composition, the lifetime of the contained objects does not depend on the lifetime of the container. In this case, Car instances have a list of Passenger objects, but these Passenger objects can exist independently of the Car instance. They can be passed to the Car object when it's instantiated or any time before the Car instance is destroyed. However, the Passenger objects will continue to live on after the Car object is destroyed

```ruby
class Passenger
end

class Car
  def initialize(passengers)
    @passengers = passengers  # Passengers are given to the Car at creation
  end
end

# Passengers can exist without Car
passengers = [Passenger.new, Passenger.new]
my_car = Car.new(passengers)
```

### Instance Methods
Currently the GoodDog cant do anything, here is a behaviour
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "Arf!"
  end
end

sparky = GoodDog.new("Sparky")
sparky.speak

puts sparky.speak

fido = GoodDog.new("Fido")
puts fido.speak 

# can also change speak to have the name included

def speak
  "#{@name} says arf!"
end
```

### Accessor methods

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.get_name
```

this can be done more efficiently with attr_reader

```ruby
class GoodDog
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.name
```
attr_writer allows for changing/writing an instance variable
attr_accessor allows both read and write:

### self

`self` refers to the current object or context.

Inside an instance method, `self` is the current object.

```ruby
def introduce
  "Hi, I am #{self.name}"
end