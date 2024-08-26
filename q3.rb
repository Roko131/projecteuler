def foo(num_to_check)
  2.upto(num_to_check).each_with_object(Array.new) do |num, arr|
    if num_to_check % num == 0
      arr << num
      return arr if arr.reduce(&:*) == num_to_check
    end
  end
end



puts foo(13195).inspect # 5,7,13,29
puts foo(600851475143).inspect # 5,7,13,29
