# Grade book

# Remember that from Ruby 2.6 onward, a Range object can be infinite
# Remember that ranges can be used as cases in a case statement

# goal: map the average (a float) to the grade value either with
# if/elsif logic or some other method
# input: three integers from 0 to 100
# output: the grade corresponding to the mean average of the three scores
# according to the ranges in the table

# an open interval required because the mean will be a float

# def get_grade(score1, score2, score3)
#   mean = (score1 + score2 + score3) / 3.0
#   if (90..100).include?(mean)
#     'A'
#   elsif (80...90).include?(mean)
#     'B'
#   elsif (70...80).include?(mean)
#     'C'
#   elsif (60...70).include?(mean)
#     'D'
#   elsif (0...60).include?(mean)
#     'F'
#   end
# end

# LS solution

# def get_grade(s1, s2, s3)
#   result = (s1 + s2 + s3)/3

#   case result
#   when 90..100 then 'A' 
#   when 80..89  then 'B'
#   when 70..79  then 'C'
#   when 60..69  then 'D'
#   else              'F'
#   end
# end

# Further exploration

def get_grade(s1, s2, s3)
  mean = (s1 + s2 + s3) / 3.0

  case mean
  when 90..    then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else              'F'
  end
end

p get_grade(101, 110, 135) == 'A'

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"