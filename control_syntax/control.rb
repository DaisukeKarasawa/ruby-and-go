# throw と catch を使った大域脱出
language = ["ruby", "go", "python"]
numbers = [1, 2, 3]

catch :done do
  language.shuffle.each do |l|
    numbers.shuffle.each do |n|
      puts "#{n} : I study #{l}"
      # python と 3 だった場合、脱出する
      if l == 'python' && n == 3
        throw :done     # 脱出
      end
    end
  end
end

# 2 : I study go
# 1 : I study go
# 3 : I study go
# 3 : I study python
