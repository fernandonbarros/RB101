def minilang(operations)
  register = 0
  stack = []
  operations.split.each do |op|
    case op
    when 'PUSH'
      stack << register
    when 'ADD'
      register += stack.pop
    when 'SUB'
      register -= stack.pop
    when 'MULT'
      register *= stack.pop
    when 'DIV'
      register /= stack.pop
    when 'MOD'
      register %= stack.pop
    when 'POP'
      register = stack.pop
    when 'PRINT'
      puts register
    else
      register = op.to_i
    end
  end
end

minilang('PRINT')
# 0
puts '---'
minilang('5 PUSH 3 MULT PRINT')
# 15
puts '---'
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts '---'
minilang('5 PUSH POP PRINT')
# 5
puts '---'
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts '---'
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts '---'
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts '---'
minilang('-3 PUSH 5 SUB PRINT')
# 8
puts '---'
minilang('6 PUSH')
# (nothing printed; no PRINT commands)
puts '---'
minilang('3 PUSH 5 MOD PUSH 3 PUSH 7 PUSH 4 PUSH 5 MULT SUB ADD DIV PRINT')