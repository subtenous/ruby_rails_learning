# Notes for Ruby 

Very brief notes of ruby learning that I find useful to write down

## Basic Data Types

Ruby uses familiar basic data types: strings, integers, floats. Fairly similar to Python overall.

Ruby has typical operators

To obtain accurate answers in arithmetic one of the numbers must be a float 

'''ruby 
17 / 5.0 #=> 3.4

## Converting number types

Convert integer to a float
'''ruby 
13.to_f #=> 13.0

# Strings

String Interpolation

'''ruby
name = "Odin"

puts "Hello, #{name}" #=> "Hello, Odin"

# Symbols

symbols are only stored in memory once, making them faster in strings in certain situations as strings have to be stored in memory everytime they are used.

'''ruby
:my_symbol

# Variables

All makes sense

# Input and Output
played around with this in irb

print vs puts
- print keeps everything on one line including the argument passed in
- puts places the argument on a new line

ruby'''
irb(main):001:0> print "Hello World"; print "I love drinking coffee"
Hello WorldI love drinking coffee=> nil

irb(main):002:0> puts "Hello World"; puts "I love drinking coffee"
Hello World
I love drinking coffee
=> nil

'''ruby
.chomp  is used to trim separators

# Conditional Logic

<=> (spaceship operator) returns the following:

- -1 if the value on the left is less than the value on the right;
- 0 if the value on the left is equal to the value on the right; and
- 1 if the value on the left is greater than the value on the right.

Useful stuff

- case statements 
- unless statements = opposite of if statements
- ternary operator