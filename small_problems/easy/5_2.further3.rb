def time_of_day(number)
  time = Time.local(2022, 7, 10)
  time += (number * 60)
  time.strftime("%A %H:%M")
end

p time_of_day(-4231)

