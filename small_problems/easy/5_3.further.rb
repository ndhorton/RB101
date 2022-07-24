def after_midnight(time_str)
  blank_time = Time.new(2000, 1, 1, 0, 0)
  time_arr = time_str.split(':').map(&:to_i)
  time_arr[0] %= 24
  user_time = Time.new(2000, 1, 1, time_arr[0], time_arr[1])
  minutes = (user_time - blank_time) / 60
  minutes.to_i
end

def before_midnight(time_str)
  blank_time = Time.new(2000, 1, 2, 0, 0)
  time_arr = time_str.split(':').map(&:to_i)
  time_arr[0] %= 24
  user_time = Time.new(2000, 1, 1, time_arr[0], time_arr[1])
  minutes = ((blank_time - user_time) / 60).to_i
  minutes == 1440 ? 0 : minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0