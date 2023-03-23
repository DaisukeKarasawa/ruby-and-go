# 与えられた引数 n の総和の総和を求める
def multipleOfTwoTotal(n)
  # n が 0 でなければ、n-1 したものを引数に multipleOfTwoTotal を再帰呼び出しして、n を引数に　multiplication を呼び出す
  n <= 0 ? 0 : multipleOfTwoTotal(n - 1) + multiplication(n)
end

# 与えられた n の総和を求める
def multiplication(n)
  # n が 0 でなければ、n-1 したものを引数に multiplication を再帰呼び出しする
  n <= 0 ? 0 : multiplication(n - 1) + n
end

puts multipleOfTwoTotal(2)  # 4
puts multipleOfTwoTotal(5)  # 35
puts multipleOfTwoTotal(9)  # 165