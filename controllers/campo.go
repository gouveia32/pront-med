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

	"pront-med/models"
)

var ()

type CampoController struct {
	BaseController
}

func (self *CampoController) List() {
	self.Data["pageTitle"] = "Gerenciamento de campos"
	self.display()
}

func (self *CampoController) Table() {
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
	//Investigar
	filters := make([]interface{}, 0)

	if Nome != "" {
		filters = append(filters, "campo_nome__icontains", Nome)
	}
	result, count := models.CampoGetList(page, self.pageSize, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["nome"] = v.Nome
		row["descricao"] = v.Descricao
		row["resposta"] = v.Resposta
		list[k] = row
	}
	self.ajaxList("sucesso", MSG_OK, count, list)
}

func (self *CampoController) Add() {
	self.Data["pageTitle"] = "Novo Campo"

	self.display()
}

func (self *CampoController) Edit() {
	id, _ := self.GetInt("id", 0)
	campo, _ := models.CampoGetById(id)
	row := make(map[string]interface{})
	row["id"] = campo.Id
	row["nome"] = campo.Nome
	row["descricao"] = campo.Descricao
	row["resposta"] = campo.Resposta
	self.Data["campo"] = row
	self.display()
}

func (self *CampoController) AjaxSave() {

	Pub_id, _ := self.GetInt("id")
	if Pub_id == 0 {
		Campo := new(models.Campo)

		Campo.Nome = strings.TrimSpace(self.GetString("nome"))
		Campo.Descricao = strings.TrimSpace(self.GetString("descricao"))
		Campo.Resposta = strings.TrimSpace(self.GetString("resposta"))

		_, err := models.CampoAdd(Campo)
		if err != nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}
		self.ajaxMsg("", MSG_OK)
	}
	//修改
	Campo, _ := models.CampoGetById(Pub_id)
	Campo.Id, _ = self.GetInt("id")
	Campo.Nome = strings.TrimSpace(self.GetString("nome"))
	Campo.Descricao = strings.TrimSpace(self.GetString("descricao"))
	Campo.Resposta = strings.TrimSpace(self.GetString("resposta"))

	if err := Campo.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}

func (self *CampoController) AjaxDel() {

	Pub_id, _ := self.GetInt("id")
	Api, _ := models.CampoGetById(Pub_id)
	//Api.Estado = 0
	Api.Id = Pub_id

	//TODO

	if err := Api.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}
