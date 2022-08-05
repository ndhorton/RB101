def staggered_case(string, strict_alternate=false)
  upcase_turn = true
  staggered_str = ''

  string.each_char do |char|
    if char =~ /[a-z]/i
      if upcase_turn
        staggered_str << char.upcase
      else 
        staggered_str << char.downcase
      end
      upcase_turn = !upcase_turn unless strict_alternate
    else
      staggered_str << char
    end
    upcase_turn = !upcase_turn if strict_alternate
  end

  staggered_str
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('ALL CAPS', true) == 'AlL CaPs'