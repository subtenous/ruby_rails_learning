require 'pry-byebug'

puts "Using puts:"
puts []
p "Using p:"
p []

def yell_greeting(string)
  name = string

  binding.pry

  name = name.upcase
  greeting = "WASSAP, #{name}!"
  puts greeting
end

yell_greeting("bob")