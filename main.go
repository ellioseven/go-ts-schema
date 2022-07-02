package main

import (
	"encoding/json"
	"fmt"
	schema "main/out/go"
)

func main() {
	bs := schema.BalanceSnapshot{
		Id:       int64(10),
		Quantity: int64(5),
		Symbol:   "ETH",
	}

	d, _ := json.Marshal(bs)
	fmt.Println(string(d))
}
