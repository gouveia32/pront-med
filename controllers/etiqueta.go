/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-09 12:53:05
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-24 18:50:54
***********************************************/
package controllers

import (
	"pront-med/models"
	"strings"
	//"github.com/astaxie/beego"
)

type EtiquetaController struct {
	BaseController
}

func (self *EtiquetaController) List() {
	self.Data["pageTitle"] = "etiqueta"
	self.display()
}

func (self *EtiquetaController) Add() {
	self.Data["pageTitle"] = "Nova etiqueta"

	self.display()
}

func (self *EtiquetaController) Edit() {
	self.Data["pageTitle"] = "Alterando etiqueta"

	id, _ := self.GetInt("id", 0)
	etiqueta, _ := models.EtiquetaGetById(id)
	row := make(map[string]interface{})
	row["id"] = etiqueta.Id
	row["nome"] = etiqueta.Nome

	self.Data["etiqueta"] = row

	self.display()
}

func (self *EtiquetaController) Table() {
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

	result, count := models.EtiquetaGetList(page, self.pageSize, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		//row["ColorText"] = ColorText
		row["id"] = v.Id
		row["nome"] = v.Nome

		list[k] = row
	}
	self.ajaxList("sucesso", MSG_OK, count, list)
}

func (self *EtiquetaController) AjaxSave() {
	Etiqueta_id, _ := self.GetInt("id")
	if Etiqueta_id == 0 {
		Etiqueta := new(models.Etiqueta)

		Etiqueta.Nome = strings.TrimSpace(self.GetString("nome"))

		if _, err := models.EtiquetaAdd(Etiqueta); err != nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}
		self.ajaxMsg("", MSG_OK)
	}

	EtiquetaUpdate, _ := models.EtiquetaGetById(Etiqueta_id)
	//Rever
	EtiquetaUpdate.Nome = strings.TrimSpace(self.GetString("nome"))

	if err := EtiquetaUpdate.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}

func (self *EtiquetaController) AjaxDel() {

	etiqueta_id, _ := self.GetInt("id")
	etiqueta, _ := models.EtiquetaGetById(etiqueta_id)
	etiqueta.Id = etiqueta_id

	//TODO Determinar se o grupo deve ser usado temporariamente

	if err := etiqueta.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}
