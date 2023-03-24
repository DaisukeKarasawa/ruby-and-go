package main

import (
	"fmt"
	"time"
)

// 引数 n の総和をチャネルに送信する
func goroutine(n int, ch chan int) {
	sum := 0
	for i := 0; i <= n; i++ {
		sum += i
	}
	
	// あえてチャネルへの送信を遅らせる
	time.Sleep(1 * time.Millisecond)
	ch <- sum
}

// LOOP と出力する
func loop()  {
	fmt.Println("LOOP")
}

func main() {
	ch := make(chan int)
	go goroutine(5, ch)

	// ゴルーチン処理でチャネルを受信するまで繰り返し処理をする
	OuterLoop:
		for {
			select {
			case n := <-ch:
				fmt.Println("receive", n)
				break OuterLoop
			default:
				loop()
			}
		}

	fmt.Println("done")

	// LOOP
	// LOOP
	// ...
	// receive 15
	// done
}