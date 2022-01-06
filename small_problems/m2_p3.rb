LETTERS = ('a'..'z').to_a.join

def letter_percentages(str)
  length = str.length.to_f
  lcase_count = str.count(LETTERS)
  ucase_count = str.count(LETTERS.upcase)

  {lowercase: (lcase_count / length * 100).round(1),
   uppercase: (ucase_count / length * 100).round(1),
   neither: ((length - ucase_count - lcase_count) / length * 100).round(1)}
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')