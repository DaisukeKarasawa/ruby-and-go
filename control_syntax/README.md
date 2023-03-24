## break

break を使用すると、繰り返し処理を脱出することが出来る。

ただし、繰り返し処理が入れ子になっている場合は、**一番内側の繰り返し処理**を脱出する。

### RubyとGoの違い

*Ruby*：

繰り返し処理のみにしか break を使用できない。(each, while, until, for)
```
def control(n)
  break if n == 2   # Invalid break

  case n
  when 2
    break           # Invalid break
  end
end

control(2)
```
*Go*：

Ruby と同じくif文では使用できないが、switch文では使用できる。(for, switch, select)

(＝ Goの場合、break は繰り返し処理以外にも使うことが出来る)
```
func control(n int)  {
  if n == 2 {
    break    // break not in for, switch, or select statement
  }

  switch n {
  case 10:
    break
  }
}
```

### breakとreturnの違い

break は「繰り返し処理からの脱出」になるが、return を使うと「(繰り返し処理のみならず)メソッド・関数など大本からの脱出」になる。
```
# Ruby
def control1
  i = 0
  while i < 5
    break if i == 1     # while文から脱出する
    i += 1
  end
  puts "not break"      # ここから処理を再開する
end

def control2
  i = 0
  while i < 5
    return if i == 1    # control2から脱出する
    i += 1
  end
  puts "not break"      # 処理されない
end

control1  # not break
control2  # 
```


##### 余談

メソッドや関数内でなくても、break と return を使用できる。
```
# Ruby
[1, 2, 3].each do |n|
  puts i          # 1
  braek
end

i = 0
while i < 5
  puts i          # 0
  return
  i += 1
end
```
**注意点**

直接 return を使用した場合、全ての処理が強制的に終了する。
```
// Go
func main() {
	for i := 0; i < 5; i++ {
		fmt.Println(i)        // 0
		return                // main関数から脱出する
	}
  fmt.Println("braek")    // 処理されない
}
```

### [throwとcatchによる大域脱出（Ruby）](https://github.com/DaisukeKarasawa/ruby-and-go/blob/master/control_syntax/control.rb)

Rubyの場合、break では一番内側の繰り返し処理しか脱出できないので、

一気に外側のループまで脱出したい場合は、Kernelモジュールのthrowメソッドとcatchメソッドを使用する。
```
catch タグ do
  ...処理
  throw タグ
end
```
**ポイント**

・Rubyの throw, catch は例外処理とは全く関係はない。

・通常タグにはシンボルを使用し、throw と catch のタグが一致しない場合はエラーが発生する。

・繰り返し処理と無関係に利用することも可能。

・throw に第二引数を渡すと catchメソッドの戻り値になる。
```
num =
  catch :done do
    throw :done, 100
  end

puts num  # 100
```

### [ラベル付きによる大域脱出（Go）](https://github.com/DaisukeKarasawa/ruby-and-go/blob/master/control_syntax/control.go)

Rubyと同じように、通常の break では自分の属するブロックの一階層分しか脱出できないので、

ラベル指定のbreak文と組み合わせて任意の階層まで脱出する。
```
ラベル名:
  // 構造を持つ文
  for {
    for {
      for {
        break ラベル名
      }
    }
  }
```

##### 余談

Goには関数内の任意の位置へジャンプするためのgoto文が用意されている。
```
// contol.go のラベル付きforループを goto で書き直した場合
for {
	select {
	case n := <-ch:
		fmt.Println("receive", n)
		goto OuterLoop    // OuterLoop へジャンプする
	default:
		loop()
	}
}
OuterLoop:
```

**注意点**

１：関数の間をジャンプすることはできない。

２：for文などの構成するブロックの「内側」にジャンプすることはできない。

３：何かしらの変数定義を飛び越えてジャンプすることはできない。

（条件によって変数が定義される場合と定義されない場合が発生する処理は、書くことが出来ない）

４：goto の使用は、プログラムの制御フローを追跡するのが難しくなり、プログラムを理解しにくく、
　　変更が困難になるため、**使用を避けるべき**。

