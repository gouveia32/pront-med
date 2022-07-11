package main

import (
	"time"

	"pront-med/models"
	_ "pront-med/routers"

	"pront-med/utils"

	"github.com/astaxie/beego"
	cache "github.com/patrickmn/go-cache"
)

func main() {
	models.Init()
	utils.Che = cache.New(60*time.Minute, 120*time.Minute)
	beego.Run()
}
