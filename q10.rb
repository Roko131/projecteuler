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

def foo(primes_below)
  sum = 2
  current_prime = 2
  loop do
    next_prime = find_next_prime(current_prime)
    current_prime = next_prime
    return sum if next_prime >= primes_below
    sum += next_prime
  end
  sum
end

puts foo(10) # 17
# puts foo(2_000_000) # 142913828922
# require 'prime'
# puts Prime.each(2_000_000).sum
