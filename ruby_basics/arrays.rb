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

# TOP array exercies 

def nil_array(number)
  # return an array containing `nil` the given number of times
  Array.new(number)
end

def first_element(array)
  # return the first element of the array
  array.first
end

def third_element(array)
  # return the third element of the array
  array[2]
end

def last_three_elements(array)
  # return the last 3 elements of the array
  array.last(3)
end

def add_element(array)
  # add an element (of any value) to the array
    array << "ruby"
end

def remove_last_element(array)
  # Step 1: remove the last element from the array
  array.pop
  # Step 2: return the array (because Step 1 returns the value of the element removed)
  array
end

def remove_first_three_elements(array)
  # Step 1: remove the first three elements
  array.shift(3)
  # Step 2: return the array (because Step 1 returns the values of the elements removed)
  array
end

def array_concatenation(original, additional)
  # return an array adding the original and additional array together
  original + additional
end

def array_difference(original, comparison)
  # return an array of elements from the original array that are not in the comparison array
  original - comparison
end

def empty_array?(array)
  # return true if the array is empty
  array.empty?
end

def reverse(array)
  # return the reverse of the array
  array.reverse
end

def array_length(array)
  # return the length of the array
  array.length
end

def include?(array, value)
  # return true if the array includes the value
  array.include?(value)
end

def join(array, separator)
  # return the result of joining the array with the separator
  array.join(separator)
end