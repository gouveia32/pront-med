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
	"fmt"

)

type NotaController struct {
	BaseController
}

func (self *NotaController) List() {
	self.Data["pageTitle"] = "nota"
	self.display()
}

func (self *NotaController) Add() {
	self.Data["pageTitle"] = "Novo nota"

	self.display()
}

func (self *NotaController) Edit() {
	self.Data["pageTitle"] = "Alterando nota"

	self.Data["uf"] = new(models.Nota).GetEstados()

	id, _ := self.GetInt("id", 0)
	nota, _ := models.NotaGetById(id)
	row := make(map[string]interface{})
	row["id"] = nota.Id
	row["nome"] = nota.Nome
	row["estado"] = int8(nota.Estado)

	self.Data["nota"] = row

	self.display()
}

func (self *NotaController) Table() {
	//Lista
	page, err := self.GetInt("page")
	if err != nil {
		page = 1
	}
	limit, err := self.GetInt("limit")
	if err != nil {
		limit = 30
	}

	Busca := strings.TrimSpace(self.GetString("Busca"))
	estado, _ := self.GetInt("estado", 1)
	where := ""

	if estado != -1 {
		where = fmt.Sprintf("stado IN (%d)",estado)
	}

	self.pageSize = limit

	if Busca != "" {
		if where != "" {
			where += " AND "
		}
		where += " nome like %" + Busca + "%"
	}

	StatusText := make(map[int]string)
	StatusText[1] = "<font color='green'>Ativo</font>"
	StatusText[2] = "<font color='red'>Desligado</font>"
	StatusText[3] = "<font color='purple'>Licenciado</font>"

	result, count := models.NotaGetList(page, self.pageSize, where)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["nome"] = v.Nome
		row["estado"] = StatusText[int(v.Estado)]

		list[k] = row
	}
	self.ajaxList("sucesso", MSG_OK, count, list)
}

func (self *NotaController) AjaxSave() {
	nota_id, _ := self.GetInt("id")
	if nota_id == 0 {
		nota := new(models.Nota)

		nota.Nome = strings.TrimSpace(self.GetString("nome"))

		nota.Estado = 1

		// Verifique se o login foi feito

		if _, err := models.NotaAdd(nota); err != nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}
		self.ajaxMsg("", MSG_OK)
	}

	notaUpdate, _ := models.NotaGetById(nota_id)
	//Rever
	notaUpdate.Nome = strings.TrimSpace(self.GetString("nome"))

	notaUpdate.Estado, _ = self.GetInt8("estado")

	if err := notaUpdate.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}

func (self *NotaController) AjaxDel() {

	Nota_id, _ := self.GetInt("id")
	Nota, _ := models.NotaGetById(Nota_id)
	Nota.Estado = 0
	Nota.Id = Nota_id

	//TODO Determinar se o grupo deve ser usado temporariamente

	if err := Nota.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}
