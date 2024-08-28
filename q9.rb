# a^2 + b^2 = c^2
#
# c= square_root(a^2 + b^2)
#
# a+b+c= 1000
# a+b+square_root(a^2 + b^2) = 1000

def foo
  max = 1000

  (1..max).each do |aa|
    (1..max).each do |bb|
      cc_square = aa**2 + bb**2
      cc = Math.sqrt(cc_square)
      next unless cc.to_i == cc
      return "#{aa} + #{bb} + #{cc} = 1000; abc=#{aa*bb*cc}" if aa+bb+cc == 1000
    end
  end
end

puts foo
