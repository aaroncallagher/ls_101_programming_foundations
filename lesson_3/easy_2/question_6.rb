ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

youngest = 100000 # A number really high that nobody can be older than
ages.each_value do |age|
  if age < youngest
    youngest = age
  end
end

puts youngest

# Also...

puts ages.values.min