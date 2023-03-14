package main

import (
	"fmt"
	"math"
)

// 1 / 2 * 重力加速度 * ( 到達時間 ** 2 ) を小数点以下切り捨てて出力
func fallingDistance(planet string, time int) (height int) {
	height = int(math.Trunc(changeMeterToMile(eachGravity(planet) * math.Pow(float64(time), 2) / 2)))
	return
}

// 惑星それぞれの重力加速度
func eachGravity(p string) float64 {
	switch p {
	case "Earth":
		return 9.8
	case "Jupiter":
		return 24.79
	case "Mercury":
		return 3.7
	default:
		return 0.0
	}
}

func changeMeterToMile(s float64) float64 {
	mile := 0.000621371
	return s * mile
}

func main() {
	fmt.Println(fallingDistance("Earth", 5000))		// 76117
	fmt.Println(fallingDistance("Jupiter",1000))	// 7701
}
