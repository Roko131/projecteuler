# we don't need to check every number, for example there's no point in checking 2, nor 3, when you check 6,
# since by checking 6 you already checking 2 because 6=2*3
def numbers_to_check(high_num)
  (2..high_num).reject do |num_to_check|
    disqualified = (2..high_num).any? do |num|
      next if num <= num_to_check
      res = num % num_to_check == 0
      res
    end
    disqualified
  end
end

def foo(high_num)
  nums_to_check = numbers_to_check(high_num)
  nums_to_check_sorted = nums_to_check.sort.reverse
  max_num = (1..high_num).reduce(&:*)
  (high_num..max_num).step(high_num) do |num_to_check| # steping in steps of 20
    good = nums_to_check_sorted.all? do |num|
      num_to_check % num == 0
    end
    return num_to_check if good
  end
end

puts foo(10)
# puts foo(20)
