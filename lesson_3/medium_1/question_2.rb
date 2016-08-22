statement = "The Flintstones Rock"
characters = statement.delete!(" ").chars
letters_hash = {}

characters.each do |char|
  if !(letters_hash.key?(char))
    letters_hash[char] = 1
  else
    letters_hash[char] += 1
  end
end

puts letters_hash
