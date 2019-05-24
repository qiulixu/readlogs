package main

import (
	"time"

	_ "readlogs/routers"

	_"readlogs/models"
	"github.com/astaxie/beego"
	"github.com/patrickmn/go-cache"
	_ "readlogs/cronTable"
	"readlogs/utils"
)

func main() {
	utils.Che = cache.New(60*time.Minute, 120*time.Minute)
	beego.Run()
}
