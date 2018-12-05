def staggered_case(str)
  str.chars.map.with_index do |char, idx|
    idx.even? ? char.upcase : char.downcase
  end.join
end

# given solution
def staggered_case(str)
  result = ''
  need_upper = true
  str.chars do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

def staggered_case(str, first_char_upper: true)
  result = ''
  str.chars do |char|
    if first_char_upper
      result += char.upcase
    else
      result += char.downcase
    end
    first_char_upper = !first_char_upper
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'