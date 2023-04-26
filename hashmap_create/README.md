## ハッシュマップ

ハッシュマップの作成において、'Hash.new' '{}' で作成するハッシュと'Hash.new(0)'で作成するハッシュには大きな違いがある。

### Hash.new / {}

新しい空のハッシュを作成するメソッド。

```
hashmap1 = Hash.new
hashmap2 = {}
```

この形で作成されたハッシュは、初期状態ではどのキーにも対応する値を持たない。

仮に、適当なキーを指定して取り出そうとすると 'nil' が返される。

```
hashmap = Hash.new
puts hashmap['age']    # => nil
```

このように、'Hash.new' で作成したハッシュには、自動的にデフォルト値が設定されないので、キーに対応する値を取り出す前に、値を設定する必要がある。

```
hashmap = Hash.new
hashmap['age'] = 20
puts hashmap['age']     # => 20
```

### Hash.new{0}

上記と同様、新しいハッシュを作成するメソッドだが、大きな違いとして、作成されたメソッドに対して初期値が設定されているので、この初期値である '0' がキーに対応する値が存在しない場合に、自動的に返される。

```
hashmap = Hash.new(0)
```

この初期の時点ではどのキーにも対応する値がないが、その場合には自動的に '0' が返される。

```
hashmap = Hash.new(0)
hashmap['age']          # => 0
```

### 使う上での大きな違い

キーの値を加算代入してカウントしていく処理を、'Hash.new' で作成する場合、先にキーの値をセットする必要がある。

```
def hashCount(hashmap)
    hashmap['age'] += 1     # undefined method `+' for nil:NilClass
end

hashmap1 = Hash.new
hashCount(hashmap1)
hashCount(hashmap1)
hashCount(hashmap1)
puts hashmap1['age']
```

この場合、以下のように修正することができる

```./hashmap.rb
def hashCount1(hashmap)
    # 対応するキーの値が nil の場合、1 を初期値として代入する
    hashmap['age'] == nil ? hashmap['age'] = 1 : hashmap['age'] += 1
end

# ハッシュ作成
hashmap1 = Hash.new
hashCount1(hashmap1)
hashCount1(hashmap1)
hashCount1(hashmap1)
puts hashmap1['age']    # => 3
```

'Hash.new(0)' で初期値に 0 が代入されるように定義してある場合、直接自己代入することが可能。

従って、自己代入したい処理にはハッシュの初期値をセットした上でインスタンスを作成した方が良い。

```./hashmap.rb
def hashCount2(hashmap)
    hashmap['age'] += 1
end

# ハッシュ作成
hashmap2 = Hash.new(0)
hashCount2(hashmap2)
hashCount2(hashmap2)
hashCount2(hashmap2)
puts hashmap2['age']    # => 3
```
