def balanced?(str)
  parenthesis_count = 0
  str.chars.each do |chr|
    if chr == '('
      parenthesis_count += 1
    elsif chr == ')'
      parenthesis_count -= 1
    end
    break if parenthesis_count < 0
  end
  return parenthesis_count.zero? ? true : false
end

def balanced?(str)
  pair_count = {'(': 0, '[': 0, '{': 0}
  str.chars.each do |chr|
    case chr
    when '(' then pair_count['('.to_sym] += 1
    when ')' then pair_count['('.to_sym] -= 1
    when '[' then pair_count['['.to_sym] += 1
    when ']' then pair_count['['.to_sym] -= 1
    when '{' then pair_count['{'.to_sym] += 1
    when '}' then pair_count['{'.to_sym] -= 1
    end
    
    break if pair_count.any? {|_, count| count < 0}
  end

  str.count("'\"").even? && pair_count.all? {|_, count| count == 0}
end



p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?("'Hello'") == true
p balanced?("'Hello") == false
