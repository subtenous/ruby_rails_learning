def shift_char(char, shift, base)
  position = char.ord - base 
  shifted_position = (position + shift) % 26
  (base + shifted_position).chr
end

def caesar_cipher(string, shift)
    string.chars.map do |char|
      if char.ord.between?("a".ord, "z".ord)
        base = "a".ord
        shift_char(char, shift, base)
      elsif char.ord.between?("A".ord, "Z".ord)
        base = "A".ord
        shift_char(char, shift, base)
      else
        char
      end
    end.join
end

puts caesar_cipher("What a string!", 5)
puts caesar_cipher("xyz", 1)
puts caesar_cipher("XYZ", 1)
puts caesar_cipher("abc", 27)