flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|name| name[0..2]}

p flintstones