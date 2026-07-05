def caesar_cipher(string, shift)
  converted_string = ""

  string.chars.each do |char|
    #lowercase check
    if char.ord.between?("a".ord, "z".ord )
      converted_char = char.ord
      converted_char += shift 
      
      if converted_char > "z".ord
        converted_char -= 26
      end
      final_char = converted_char.chr

    # uppercase check
    elsif char.ord.between?("A".ord, "Z".ord)
      converted_char = char.ord
      converted_char += shift 
      
      if converted_char > "Z".ord
        converted_char -= 26
      end
      final_char = converted_char.chr

    else
      final_char = char
    end
  
    converted_string << final_char
  end

  converted_string
end

puts caesar_cipher("What a string!", 5)