flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash1 = {}

flintstones.each_with_index {|person, position| hash1[person] = position}

puts hash1