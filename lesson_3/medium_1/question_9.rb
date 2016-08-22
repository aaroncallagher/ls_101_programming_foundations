munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |member, traits|
  case traits["age"]
    when (0..17)
      traits["age_group"] = "kid"
    when (18..64)
      traits["age_group"] = "adult"
    else
      traits["age_group"] = "senior"
  end
end

p munsters