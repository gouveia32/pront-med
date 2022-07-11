/**********************************************
** @Des: login
** @Author: haodaquan
** @Date:   2017-09-07 16:30:10
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-17 11:55:21
***********************************************/
package controllers

import (
	"pront-med/libs"
	"pront-med/models"
	"pront-med/utils"
	"strconv"
	"strings"
	"time"

	"github.com/astaxie/beego"
	cache "github.com/patrickmn/go-cache"
)

type LoginController struct {
	BaseController
}

//Login TODO:Filtragem XSRF
func (self *LoginController) LoginIn() {
	if self.userId > 0 {
		self.redirect(beego.URLFor("HomeController.Index"))
	}
	beego.ReadFromRequest(&self.Controller)
	if self.isPost() {

		username := strings.TrimSpace(self.GetString("username"))
		password := strings.TrimSpace(self.GetString("password"))

		if username != "" && password != "" {
			user, err := models.AdminGetByName(username)
			///fmt.Println(user)
			flash := beego.NewFlash()
			errorMsg := ""
			if err != nil || user.Password != libs.Md5([]byte(password+user.Salt)) {
				errorMsg = "usuário ou senha incorreto"
			} else if user.Status == 0 {
				errorMsg = "A conta está desativada"
			} else {
				user.LastIp = self.getClientIp()
				user.LastLogin = time.Now().Unix()
				user.Update()
				utils.Che.Set("uid"+strconv.Itoa(user.Id), user, cache.DefaultExpiration)
				authkey := libs.Md5([]byte(self.getClientIp() + "|" + user.Password + user.Salt))
				self.Ctx.SetCookie("auth", strconv.Itoa(user.Id)+"|"+authkey, 7*86400)

				self.redirect(beego.URLFor("HomeController.Index"))
			}
			flash.Error(errorMsg)
			flash.Store(&self.Controller)
			self.redirect(beego.URLFor("LoginController.LoginIn"))
		}
	}
	self.TplName = "login/login.html"
}

//Sair
func (self *LoginController) LoginOut() {
	self.Ctx.SetCookie("auth", "")
	self.redirect(beego.URLFor("LoginController.LoginIn"))
}

func (self *LoginController) NoAuth() {
	self.Ctx.WriteString("Permissão negada")
}
