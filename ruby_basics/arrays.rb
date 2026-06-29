# arrays.rb

# Indexing arrays

numbers = [1, 2, 3, 4, 5]

puts numbers[0]     # prints 1
puts numbers[2]     # prints 3
puts numbers[-1]    # prints 5
puts numbers[-2]    # prints 4

puts "--- first and last methods ---"

puts numbers.first       # prints 1
puts numbers.last        # prints 5
p numbers.first(3)       # prints [1, 2, 3]

puts "--- adding and removing elements ---"

num_array = [1, 2, 3]

p num_array.push(4, 5)   # adds 4 and 5 to the end: [1, 2, 3, 4, 5]
p num_array << 6         # adds 6 to the end: [1, 2, 3, 4, 5, 6]
puts num_array.pop       # removes and returns the final element: 6
p num_array              # [1, 2, 3, 4, 5]

puts "--- shift and unshift ---"

num_array = [2, 3, 4]

p num_array.unshift(1)   # adds 1 to the beginning: [1, 2, 3, 4]
puts num_array.shift     # removes and returns the first element: 1
p num_array              # [2, 3, 4]

puts "--- concatenation ---"

a = [1, 2, 3]
b = [3, 4, 5]

p a + b                  # [1, 2, 3, 3, 4, 5]
p a.concat(b)            # changes a permanently: [1, 2, 3, 3, 4, 5]
p a                      # a is now [1, 2, 3, 3, 4, 5]

p [1, 1, 1, 2, 2, 3, 4] - [1, 4]  # [2, 2, 3]

puts "--- basic array methods ---"

p [].empty?               # true
p [[]].empty?             # false
p [1, 2].empty?           # false

puts [1, 2, 3].length     # 3

p [1, 2, 3].reverse       # [3, 2, 1]

p [1, 2, 3].include?(3)   # true
p [1, 2, 3].include?("3") # false

puts [1, 2, 3].join       # "123"
puts [1, 2, 3].join("-")  # "1-2-3"