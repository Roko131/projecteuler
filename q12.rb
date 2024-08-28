@prime_hash = {1 => true}
$stdout.sync = true
@triangle_h = {0 => 0, 1 => 1, 2 => 3}

def is_prime?(num_to_check)
  return @prime_hash[num_to_check] if @prime_hash.has_key? num_to_check

  square_root = Math.sqrt(num_to_check).to_i
  # puts "square_root: #{square_root}"
  (2..square_root).each do |num|
    # puts "num: #{num}"
    if (num_to_check % num == 0)
      @prime_hash[num_to_check] = false
      return false
    end
  end

  @prime_hash[num_to_check] = true
end

def triangle_num_old(nth)
  (1..nth).sum
end

def triangle_num(nth)
  @triangle_h[nth] = @triangle_h[nth-1] + nth
end

def get_factors(num)
  (1..(num/2)).select{|part| num % part == 0} + [num]
end

def get_factors_old(num)
  (1..(num)).select{|part| num % part == 0}
end

def get_factors_length(num)
  (2..(num/2)).count{|part| num % part == 0} + 2
end

def get_factors_fast_length(num)
  div = num > 200 ? 100 : 2
  (2..(num/div)).count{|part| num % part == 0} + (1...div).count{|part| num % part == 0} + 1
end

def get_factors_fast_length(num)
  div = num > 200 ? Math.sqrt(num).floor : 2

  (2..(num/div)).count{|part| num % part == 0} + (1...div).count{|part| num % part == 0} + 1
end


def foo(over_num_divisors)
  highest = 0
  (1..Float::INFINITY).each_with_index do |num, index|
    length = get_factors_fast_length(triangle_num(num))
    puts "num: #{num}, triangle_num: #{triangle_num(num)}, length: #{length}" if index % 500 == 0
    if length > highest
      puts "NEW RECORD: num: #{num}, triangle_num: #{triangle_num(num)}, length: #{length}"
      highest = length
    end
    if length > over_num_divisors
    # if get_factors(triangle_num(num)).length > over_num_divisors
    # if get_factors_old(triangle_num(num)).length > over_num_divisors
      return "num: #{num}, triangle_num: #{triangle_num(num)}, length: #{length}"
      # return num
    end
  end
end

# num = 14
# puts triangle_num_old(num)
# puts get_factors(triangle_num(num)).inspect
# puts get_factors(15).inspect
# puts get_factors(28).inspect
# nil
# puts foo(5)
# puts foo(50)
# puts foo(150)
# puts foo(500)
puts foo(576)

# NEW RECORD: num: 12375, triangle_num: 76576500, length: 576
