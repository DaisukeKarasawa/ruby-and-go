def hashCount1(hashmap)
    # 対応するキーの値が nil の場合、1 を初期値として代入する
    hashmap['age'] == nil ? hashmap['age'] = 1 : hashmap['age'] += 1
end

def hashCount2(hashmap)
    # 定義されていなかったキーにも加算代入が直接できる
    hashmap['age'] += 1
end

# ハッシュ作成
hashmap1 = Hash.new
hashCount1(hashmap1)
hashCount1(hashmap1)
hashCount1(hashmap1)
puts hashmap1['age']

# ハッシュ作成
hashmap2 = Hash.new(0)
hashCount2(hashmap2)
hashCount2(hashmap2)
hashCount2(hashmap2)
puts hashmap2['age']