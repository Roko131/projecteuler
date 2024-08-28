def is_prime?(num_to_check)
  square_root = Math.sqrt(num_to_check).to_i
  # puts "square_root: #{square_root}"
  (2..square_root).each do |num|
    # puts "num: #{num}"
    return false if (num_to_check % num == 0)
  end
  true
end

def find_next_prime(next_prime_from)
  ((next_prime_from+1)..Float::INFINITY).each do |num|
    return num if is_prime?(num)
  end
end

def foo(nth_prime)
  current_prime = 1
  nth_prime.times do
    next_prime = find_next_prime(current_prime)
    current_prime = next_prime
  end
  current_prime
end

puts foo(10_001)
# require 'prime'
# puts Prime.first(10_001).last

# puts is_prime?(5)
# puts foo(100)
# puts (1..99).map{"#{_1}: #{is_prime?(_1)}"}
# puts (1..99).select{is_prime?(_1)}
