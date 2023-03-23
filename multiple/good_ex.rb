def multipleOfTwoTotal(n)
  # 合計値を保存するための引数を加える（補助関数）
  calc(n, 0)
end

# 与えられた引数 n の総和の総和を求める
def calc(n, total)
  # n が 0 でなければ、n-1 して total に totalCalculation の結果を加えた上で calc（補助関数）を呼び出す
  n == 0 ? total : calc(n - 1, total + totalCalculation(n, 0))
end

# 与えられた n の総和を求める
def totalCalculation(n, total)
  # n が 0 でなければ、n-1 して total に n を加えた上で totalCalculation を呼び出す
  n == 0 ? total : totalCalculation(n - 1, total + n)
end

puts multipleOfTwoTotal(2)  # 4
puts multipleOfTwoTotal(5)  # 35
puts multipleOfTwoTotal(9)  # 165