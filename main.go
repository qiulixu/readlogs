package main

import (
	"time"

	"readlogs/models"
	_ "readlogs/routers"

	"github.com/astaxie/beego"
	"readlogs/utils"
	cache "github.com/patrickmn/go-cache"
)

func main() {
	models.Init()
	utils.Che = cache.New(60*time.Minute, 120*time.Minute)
	beego.Run()
}
