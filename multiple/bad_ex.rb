def multipleOfTwoTotal(n)
  n <= 0 ? 0 : multipleOfTwoTotal(n - 1) + multiplication(n) * 2
end

def multiplication(n)
  n <= 0 ? 0 : multiplication(n - 1) + n
end

puts multipleOfTwoTotal(2)  # 8
puts multipleOfTwoTotal(5)  # 70
puts multipleOfTwoTotal(9)  # 330