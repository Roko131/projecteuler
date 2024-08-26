def is_palind?(num)
  st = num.to_s
  0.upto(st.length/2) do |index|
    return false unless st[index] == st[-1-index]
  end
  return true
end

def foo(num_to_check)
  arr1 = (1..num_to_check).to_a.reverse
  arr2 = arr1.dup

  res = 0
  arr1.each do |num1|
    arr2.each do |num2|
      res = num1*num2 if num1*num2 > res && is_palind?(num1*num2)
    end
  end
  res
end

puts is_palind?(903109)
puts foo(999)


# puts foo(13195).inspect # 5,7,13,29
# puts foo(600851475143).inspect # 5,7,13,29
