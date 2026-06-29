

#while loop
i = 0
while i < 5 do 
    puts "Count is #{i}"
    i += 1
end

# until loop works the same as while just opposite so loops until a condition is met

# for loop
for i in 0..5
    puts "#{i}"
end


# times loop
5.times do |number|
  puts "Alternative fact number #{number}"
end


# upto loop
5.upto(10) do |num| 
    print "#{num}"
end