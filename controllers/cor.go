/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-09 12:53:05
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-24 18:50:54
***********************************************/
package controllers

import (
	"fmt"
	"pront-med/models"
	"strings"
	//"github.com/astaxie/beego"
)

type CorController struct {
	BaseController
}

func (self *CorController) List() {
	self.Data["pageTitle"] = "cor"
	self.display()
}

func (self *CorController) Add() {
	//self.Data["pageTitle"] = "Nova cor"

	self.display()
}

func (self *CorController) Edit() {
	self.Data["pageTitle"] = "Alterando cor"

	id, _ := self.GetInt("id", 0)
	cor, _ := models.CorGetById(id)
	row := make(map[string]interface{})
	row["id"] = cor.Id
	row["nome"] = cor.Nome
	row["cor"] = "#" + cor.Cor // Acrescenta #

	self.Data["cor"] = row

	self.display()
}

func (self *CorController) Table() {
	//Lista
	page, err := self.GetInt("page")
	if err != nil {
		page = 1
	}
	limit, err := self.GetInt("limit")
	if err != nil {
		limit = 30
	}

	Nome := strings.TrimSpace(self.GetString("Nome"))
	self.pageSize = limit
	//Investiga
	filters := make([]interface{}, 0)

	if Nome != "" {
		filters = append(filters, "nome__icontains", Nome)
	}

	ColorText := ""

	result, count := models.CorGetList(page, self.pageSize, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		ColorText = fmt.Sprintf("<p style=%s>- - - - - - - -</p>", "'background-color:#"+v.Cor+";'")
		row := make(map[string]interface{})
		//row["ColorText"] = ColorText
		row["id"] = v.Id
		row["nome"] = v.Nome
		row["cor"] = ColorText

		list[k] = row
	}
	self.ajaxList("sucesso", MSG_OK, count, list)
}

func (self *CorController) AjaxSave() {
	Cor_id, _ := self.GetInt("id")
	if Cor_id == 0 {
		Cor := new(models.Cor)

		Cor.Nome = strings.TrimSpace(self.GetString("nome"))
		Cor.Cor = self.GetString("cor")[1:len(self.GetString("cor"))] // remove #
		Cor.Estado = 1

		if _, err := models.CorAdd(Cor); err != nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}
		self.ajaxMsg("", MSG_OK)
	}

	CorUpdate, _ := models.CorGetById(Cor_id)
	//Rever
	CorUpdate.Nome = strings.TrimSpace(self.GetString("nome"))
	CorUpdate.Cor = self.GetString("cor")[1:len(self.GetString("cor"))] // remove #
	CorUpdate.Estado, _ = self.GetInt8("estado")

	if err := CorUpdate.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}

func (self *CorController) AjaxDel() {

	cor_id, _ := self.GetInt("id")
	cor, _ := models.CorGetById(cor_id)
	cor.Id = cor_id

	//TODO Determinar se o grupo deve ser usado temporariamente

	if err := cor.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}
