def foo(high_num)
  sum_squares = (1..high_num).map{|num| num**2}.sum
  square_sum = (1..high_num).sum**2
  square_sum - sum_squares
end

puts foo(10)
puts foo(100)
