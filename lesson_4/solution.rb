
def sum_even_num_row(row_n)
  rows = []
  row_n.times do |row_i|
    start_integer = row_i > 0 ? rows[-1][-1] + 2 : 2
    rows << create_row(start_integer, row_i+1)
  end
  rows[-1].sum
end

def create_row(start_integer, row_length)
  row = []

  row_length.times  {|n| row << (start_integer + n * 2)}
  row
end


# tests
p create_row(2, 1) == [2]
p create_row(4, 2) == [4, 6]
p create_row(14, 4) == [14, 16, 18, 20]

p sum_even_num_row(1) == 2
p sum_even_num_row(2) == 10
p sum_even_num_row(4) == 68


