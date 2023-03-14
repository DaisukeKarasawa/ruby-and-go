## 今までRubyを使っていた自分が、Goを書いていて感じた静的型付け言語の難しさ

### 物体の自由落下について、落下距離を返すプログラム
#### [Rubyの場合]()
```ruby:pattern.rb
  changeMeterToMile(eachGravity(planet) * (time ** 2) / 2).class  # Float
  changeMeterToMile(eachGravity(planet) * (time ** 2) / 2).floor  # 小数点以下切り捨て
  fallingDistance("Jupiter",1000).class                           # Integer
```
最後に「.floor」を使うだけで小数点以下が切り捨てられ、切り捨て前の計算 (Float) が自然と戻り値は Integer になる

#### [Goの場合]()
```go:pattern.go
func fallingDistance(planet string, time int) (height int) {
	height = int(math.Trunc(changeMeterToMile(eachGravity(planet) * math.Pow(float64(time), 2) / 2)))
	return
}
```
１）重力加速度 (eachGravity()) の戻り値が float で、mile の計算 (changeMeterToMile()) にも float の引数を渡す必要があるので、累乗する time を float64 でキャストする必要がある
```go:pattern.go
  math.Pow(float64(time), 2)
```

２）戻り値の型を int で設定しているので、最後に int() でキャストする必要がある
```go:pattern.go
  height = int()
```