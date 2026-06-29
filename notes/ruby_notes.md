# Notes for Ruby 

Very brief notes of ruby learning that I find useful to write down

## Basic Data Types

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
# Strings

String Interpolation

```ruby
name = "Odin"

puts "Hello, #{name}" #=> "Hello, Odin"
```
# Symbols

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

# loops



"loop" just simply loops until the break command is used

while loops are familiar

until loop runs as long as the condition is false -  can make loops more readable if negation has to be used 

## ranges

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
# arrays

- arrays can additionally be created aside from [] using Array.new method with 2 optional arguments initial size and default value
- also uses first and last methods as well as indexing. Can retrieve first n elements of an array using .first(n)
- adding an element to end of array with << or #push, Can use #pop to pop the last element and return it 
- unshift does the same as #push but to beginning of array and same for shift with #pop
- adding and subtracting arrays is simple
- Some methods change the original array, such as `push`, `pop`, `shift`, `unshift`, and `concat`.