# basic if else statement
age = 21

if age >= 18
    puts "You are an adult"
else 
    puts "You are under 18."
end

#if elsif else works the same way

# comparing strings
role = "admin"

if role == "admin"
    puts "Access granted"
else
    puts "Access denied"
end

# Case statement
grade = "B"

case grade 
when "A"
    puts "Amazing"
when "B"
    puts "Good"
when "C"
    puts "Pass"
else puts 
    "Fail!"
end

# ternary operator: first option is if true second is if false.

age = 19
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response
