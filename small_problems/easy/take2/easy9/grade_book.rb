# Grade Book

# input: three integers representing scores
# output: a grade based on the mean of the three scores

def grade(average_score)
  case average_score
  when 0...60  then 'F'
  when 60...70 then 'D'
  when 70...80 then 'C'
  when 80...90 then 'B'
  when 90..100 then 'A'
  else              'Invalid score.'
  end
end

def get_grade(*scores)
  average_score = scores.sum.fdiv(scores.size)
  grade(average_score)
end

# Further exploration
def grade(average_score)
  case average_score
  when 0...60  then 'F'
  when 60...70 then 'D'
  when 70...80 then 'C'
  when 80...90 then 'B'
  when 90..    then 'A'
  else              'Invalid score.'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
