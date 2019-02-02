def minilang(program_str)
  stack = []
  register = 0
  
  program_str.split.each do |token|
    case token
    when 'PUSH' then stack << register  
    when 'ADD' then register += stack.pop
    when 'SUB' then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register
    else register = token.to_i
    end
  end
end

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')

