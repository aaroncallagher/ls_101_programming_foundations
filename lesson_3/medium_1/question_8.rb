def titleize(str)
  str.split(" ").map {|word| word.capitalize }.join(" ")
end

p titleize("Hi how are you")
p titleize("Go hang a salami Im a lasagna hog")