def after_midnight(time_str)
  time_arr = time_str.split(':')
  hours = time_arr[0].to_i % 24
  minutes = time_arr[1].to_i + hours * 60
  minutes
end

def before_midnight(time_str)
  time_arr = time_str.split(':')
  hours = time_arr[0].to_i % 24
  minutes = time_arr[1].to_i + hours * 60
  minutes == 0 ? 0 : 1440 - minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0