
res_arr = [1,2]

times = 99999
loop do
  new_number = res_arr[-1]+res_arr[-2]
  break if new_number >= 4_000_000
  res_arr << new_number# if new_number.even?


  times -= 1
  break if times < 0
end
puts res_arr.inspect
good_arr = res_arr.select(&:even?)
puts good_arr.inspect
puts good_arr.sum
