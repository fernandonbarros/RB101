munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |_, info|
  info['age_group'] = case
  when (0..18).include?(info['age'])
    'kid'
  when (18..65).include?(info['age'])
    'adult'
  else
    'senior'
  end
end

puts munsters