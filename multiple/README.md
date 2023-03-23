## ヘッド再帰と末尾再帰をそれぞれ使用したプログラムでの空間計算量の違い

### 末尾再帰で空間計算量を削減する

元の関数に、計算途中の結果を保存する引数を追加（補助関数を使用）して進んでいくので、呼び出し元に戻る必要がなく、スタックの累積が無くなるので、空間計算量を削減できる。

#### [空間計算量が多い場合（ヘッド再帰）](https://github.com/DaisukeKarasawa/important-code/blob/master/multiple/bad_ex.rb)

優先度の高いものから実行を開始し、終了したあとにその呼び出し元に戻る必要がある。

**スタックの状態（ n == 3 )**
```ruby:bad_ex.rb
# 総和を求める（再帰）
multiplication(3)                       # push される
multiplication(3 - 1) + 3               # push される
( multiplication(2 - 1) + 2 ) + 3       # push される
( multiplication(1 - 1) + 1 ) + 2 ) + 3 # push される
( multiplication(0) + 1 ) + 2 ) + 3     # pop する
( 0 + 1 ) + 2 ) + 3                     # pop する
( 1 + 2 ) + 3                           # pop する
3 + 3                                   # pop する
6
```

#### [空間計算量が少ない場合（末尾再帰）](https://github.com/DaisukeKarasawa/important-code/blob/master/multiple/good_ex.rb)

関数呼び出しがコールスタックに push された後、呼び出し元に戻る必要がないので、終了と共に pop される。

そして新しい関数呼び出しが push される。（空間計算量＝１）

**スタックの状態（ n == 3 ）**
```ruby:good_ex.rb
# 総和を求める（補助関数を使用）
totalCalculation(3, 0)          # push され、pop する
totalCalculation(3 - 1, 0 + 3)  # push され、pop する
totalCalculation(2 - 1, 3 + 2)  # push され、pop する
totalCalculation(1 - 1, 5 + 1)  # push され、pop する
totalCalculation(0, 6)          # push され、pop する
6
```