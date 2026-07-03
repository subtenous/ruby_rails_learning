def coffee_drink?(drink_list)
  # use #include? to return true when the drink_list (array) contains the string "coffee" or "espresso"
  drink_list.include?("coffee") || drink_list.include?("espresso")
end

p coffee_drink?(["coffee", "water"])
p coffee_drink?(["water", "apple_juice"])

def correct_guess?(guess_list, answer)
  # use #any? to return true when any element of the guess_list (array) equals the answer (number)
  guess_list.any? { |guess| guess == answer }
end

p correct_guess?([3, 2, 4, 10, 15, 7], 2)
p correct_guess?([3, 1, 4, 10, 15, 7], 2)

def twenty_first_century_years?(year_list)
  # use #all? to return true when all of the years in the year_list (array) are between 2001 and 2100
  year_list.all?{ |year| year.between?(2001, 2100) }
end

p twenty_first_century_years?([2001, 2007, 2050, 2085])
p twenty_first_century_years?([2000, 2007, 2050, 2085])

def correct_format?(word_list)
  # use #none? to return true when none of the words in the word_list (array) are in upcase
  word_list.none? { |word| word == word.upcase}
end

p correct_format?(["hello", "world", "ruby"])
p correct_format?(["hello", "WORLD", "ruby"])

def valid_scores?(score_list, perfect_score)
  # use #one? to return true when only one value in the score_list (hash) is equal to the perfect_score (number)
  score_list.one? { |_key, value| value == perfect_score}
end

p valid_scores?({alice: 100, bob: 90, charlie: 80}, 100)
p valid_scores?({alice: 100, bob: 100, charlie: 80}, 100)