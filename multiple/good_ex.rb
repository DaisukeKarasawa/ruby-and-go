def multipleOfTwoTotal(n)
  calc(n, 0)
end

def calc(n, total)
  n == 0 ? total : calc(n-1, total+totalCalculation(n, 0))
end

def totalCalculation(i, n)
  i == 0 ? n * 2 : totalCalculation(i-1, n+i)
end

puts multipleOfTwoTotal(2)  # 8
puts multipleOfTwoTotal(5)  # 70
puts multipleOfTwoTotal(9)  # 330