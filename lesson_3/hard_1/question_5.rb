def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if !(dot_separated_words.size == 4)
    return false
  end
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    if !is_a_number?(word)
      return false
    else 
      break
    end
  end
  return true
end

dot_separated_ip_address?("10.4.10.55")