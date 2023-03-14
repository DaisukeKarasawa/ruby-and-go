# 1 / 2 * 重力加速度 * ( 到達時間 ** 2 ) を小数点以下切り捨てて出力
def fallingDistance(planet,time)
  changeMeterToMile(eachGravity(planet) * (time ** 2) / 2).class  # Float
  changeMeterToMile(eachGravity(planet) * (time ** 2) / 2).floor
end

# 惑星それぞれの重力加速度
def eachGravity(planet)
  case planet
  when 'Earth'
      9.8
  when 'Jupiter'
      24.79
  when 'Mercury'
      3.7
  else
      0
  end
end

# マイル (1m = 0.000621371) に変換
def changeMeterToMile(s)
  mile = 0.000621371
  s * mile
end

puts fallingDistance("Earth", 5000)    # 76117
puts fallingDistance("Jupiter",1000)   # 7701
fallingDistance("Jupiter",1000).class  # Integer