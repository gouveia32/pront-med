/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-08 10:21:13
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-09 18:04:41
***********************************************/
package controllers

type HomeController struct {
	BaseController
}

func (self *HomeController) Index() {
	self.Data["pageTitle"] = "Home"
	//self.display()
	self.TplName = "public/main.html"
}


func (self *HomeController) Start() {
	self.Data["pageTitle"] = "Bemvindo"
	self.display()
}
