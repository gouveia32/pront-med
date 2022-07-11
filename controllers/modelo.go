/**********************************************
** @Des: 公共文档设置
** @Author: haodaquan
** @Date:   2018-01-16 17:48:30
** @Last Modified by:   haodaquan
** @Last Modified time: 2018-01-16 17:48:30
***********************************************/
package controllers

import (
	"strings"
	"time"

	"pront-med/models"

	"github.com/astaxie/beego"
)

var ()

type ModeloController struct {
	BaseController
}

func (self *ModeloController) List() {
	self.Data["pageTitle"] = "Gerenciamento de modelos"
	self.display()
}

func (self *ModeloController) Table() {
	//列表
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
	//Investigar条件
	filters := make([]interface{}, 0)
	filters = append(filters, "estado", 1)

	if Nome != "" {
		filters = append(filters, "modelo_nome__icontains", Nome)
	}
	result, count := models.ModeloGetList(page, self.pageSize, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["nome"] = v.Nome
		row["detalhe"] = v.Detalhe
		row["criado_em"] = beego.Date(time.Unix(v.CriadoEm, 0), "Y-m-d H:i:s")
		row["alterado_em"] = beego.Date(time.Unix(v.AlteradoEm, 0), "Y-m-d H:i:s")
		list[k] = row
	}
	self.ajaxList("sucesso", MSG_OK, count, list)
}

func (self *ModeloController) Add() {
	self.Data["pageTitle"] = "Novo Modelo"

	self.display()
}

func (self *ModeloController) Edit() {
	id, _ := self.GetInt("id", 0)
	modelo, _ := models.ModeloGetById(id)
	row := make(map[string]interface{})
	row["id"] = modelo.Id
	row["nome"] = modelo.Nome
	row["detalhe"] = modelo.Detalhe
	self.Data["pageTitle"] = "Verificar " + modelo.Nome
	self.Data["Detalhe"] = row
	self.display()
}

func (self *ModeloController) AjaxSave() {

	Pub_id, _ := self.GetInt("id")
	if Pub_id == 0 {
		Modelo := new(models.Modelo)

		Modelo.Nome = strings.TrimSpace(self.GetString("nome"))
		Modelo.Detalhe = strings.TrimSpace(self.GetString("detalhe"))
		Modelo.CriadorId = self.userId
		Modelo.AlteradorId = self.userId
		Modelo.CriadoEm = time.Now().Unix()
		Modelo.AlteradoEm = time.Now().Unix()
		Modelo.Estado = 1
		_, err := models.ModeloAdd(Modelo)
		if err != nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}
		self.ajaxMsg("", MSG_OK)
	}
	//修改
	Modelo, _ := models.ModeloGetById(Pub_id)
	Modelo.Id, _ = self.GetInt("id")
	Modelo.Nome = strings.TrimSpace(self.GetString("nome"))
	Modelo.Detalhe = strings.TrimSpace(self.GetString("detalhe"))

	Modelo.AlteradorId = self.userId
	Modelo.AlteradoEm = time.Now().Unix()
	Modelo.Estado = 1
	if err := Modelo.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}

func (self *ModeloController) AjaxDel() {

	Pub_id, _ := self.GetInt("id")
	Api, _ := models.ModeloGetById(Pub_id)
	Api.AlteradoEm = time.Now().Unix()
	Api.AlteradorId = self.userId
	Api.Estado = 0
	Api.Id = Pub_id

	//TODO

	if err := Api.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}
