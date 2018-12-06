def staggered_case(str)
  letter_count = 0
  str.chars.map do |char|
    if char =~ /[a-z]/i
      letter_count += 1
      letter_count.odd? ? char.upcase : char.downcase
    else
      char
    end
  end.join
end

def staggered_case(str, stagger_letters_only: false)
  case stagger_letters_only
  when true
    letter_count = 0
    str.chars.map do |char|
      if char =~ /[a-z]/i
        letter_count += 1
        letter_count.odd? ? char.upcase : char.downcase
      else
        char
      end
    end.join
  else
    str.chars.map.with_index do |char, idx|
      idx.even? ? char.upcase : char.downcase
    end.join
  end
end

# given solution
def staggered_case(str)
  result = ''
  need_upper = true
  str.chars do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

def staggered_case(str, first_char_upper: true)
  letter_count = first_char_upper ? 0 : 1
  str.chars.map do |char|
    if char =~ /[a-z]/i
      letter_count += 1
      letter_count.odd? ? char.upcase : char.downcase
    else
      char
    end
  end.join
end

p staggered_case('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') #== 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 nUmBeRs'
