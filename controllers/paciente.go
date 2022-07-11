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
	"time"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type PacienteController struct {
	BaseController
}

func (self *PacienteController) List() {
	self.Data["pageTitle"] = "Paciente"
	self.display()
}

func (self *PacienteController) Add() {
	self.Data["pageTitle"] = "Novo Paciente"

	self.Data["uf"] = new(models.Paciente).GetEstados()

	self.display()
}

func (self *PacienteController) Edit() {
	self.Data["pageTitle"] = "Alterando Paciente"

	self.Data["uf"] = new(models.Paciente).GetEstados()

	id, _ := self.GetInt("id", 0)
	paciente, _ := models.PacienteGetById(id)
	row := make(map[string]interface{})
	row["id"] = paciente.Id
	row["nome"] = paciente.Nome
	row["sexo"] = paciente.Sexo
	row["imagem"] = paciente.Imagem
	row["logradoro"] = paciente.Logradoro
	row["municipio"] = paciente.Municipio
	row["numero"] = paciente.Numero
	row["uf"] = paciente.Uf
	row["cep"] = paciente.Cep
	row["altura"] = paciente.Altura
	row["peso"] = paciente.Peso
	row["telefone"] = paciente.Telefone
	row["email"] = paciente.Email
	row["nascimento"] = beego.Date(time.Unix(paciente.Nascimento, 0), "Y-m-d")
	row["estado"] = int8(paciente.Estado)

	self.Data["paciente"] = row

	self.display()
}

func (self *PacienteController) Table() {
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
	BuscaEstado := []int{0, 1}
	if estado != -1 {
		BuscaEstado = []int{estado}
	}

	self.pageSize = limit
	//Investiga
	cond := orm.NewCondition()

	if Busca != "" {
		cond = cond.And("nome__icontains", Busca).And("estado__in", BuscaEstado)
	} else {
		cond = cond.And("estado__in", BuscaEstado)
	}

	StatusText := make(map[int]string)
	StatusText[0] = "<font color='red'>Inativo</font>"
	StatusText[1] = "Ativo"

	result, count := models.PacienteGetList(page, self.pageSize, cond)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["nome"] = v.Nome
		row["sexo"] = v.Sexo
		//row["logradoro"] = v.Logradoro
		//row["municipio"] = v.Municipio
		//row["numero"] = v.Numero
		//row["uf"] = v.Uf
		//row["cep"] = v.Cep
		row["altura"] = v.Altura
		row["peso"] = v.Peso
		row["telefone"] = v.Telefone
		row["email"] = v.Email
		//row["criado_em"] = beego.Date(time.Unix(v.CriadoEm, 0), "Y-m-d H:i:s")
		//row["alterado_em"] = beego.Date(time.Unix(v.AlteradoEm, 0), "Y-m-d H:i:s")
		//row["nascimento"] = beego.Date(time.Unix(v.Nascimento, 0), "Y-m-d")
		row["estado"] = StatusText[int(v.Estado)]

		list[k] = row
	}
	self.ajaxList("sucesso", MSG_OK, count, list)
}

func (self *PacienteController) AjaxSave() {
	layout := "2006-01-02"
	Paciente_id, _ := self.GetInt("id")
	if Paciente_id == 0 {
		Paciente := new(models.Paciente)

		Paciente.Nome = strings.TrimSpace(self.GetString("nome"))
		Paciente.Sexo = strings.TrimSpace(self.GetString("sexo"))
		Paciente.Logradoro = strings.TrimSpace(self.GetString("logradoro"))
		Paciente.Municipio = strings.TrimSpace(self.GetString("municipio"))
		Paciente.Numero = strings.TrimSpace(self.GetString("numero"))
		Paciente.Uf = strings.TrimSpace(self.GetString("uf"))
		Paciente.Cep = strings.TrimSpace(self.GetString("cep"))
		Paciente.Altura, _ = self.GetInt("altura")
		Paciente.Peso, _ = self.GetFloat("peso")
		Paciente.Telefone = strings.TrimSpace(self.GetString("telefone"))
		Paciente.Email = strings.TrimSpace(self.GetString("email"))
		Paciente.CriadoEm = time.Now().Unix()
		Paciente.AlteradoEm = time.Now().Unix()
		Paciente.Nascimento, _ = self.GetInt64("nascimento")
		t, _ := time.Parse(layout, self.GetString("nascimento"))
		Paciente.Nascimento = t.Unix() + 10800 //Adicionado 3horas para o fuso horário de Brasília
		Paciente.Estado = 1

		if _, err := models.PacienteAdd(Paciente); err != nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}
		self.ajaxMsg("", MSG_OK)
	}

	PacienteUpdate, _ := models.PacienteGetById(Paciente_id)
	//Rever
	PacienteUpdate.Nome = strings.TrimSpace(self.GetString("nome"))
	PacienteUpdate.Sexo = strings.TrimSpace(self.GetString("sexo"))
	PacienteUpdate.Logradoro = strings.TrimSpace(self.GetString("logradoro"))
	PacienteUpdate.Municipio = strings.TrimSpace(self.GetString("municipio"))
	PacienteUpdate.Numero = strings.TrimSpace(self.GetString("numero"))
	PacienteUpdate.Uf = strings.TrimSpace(self.GetString("uf"))
	PacienteUpdate.Cep = strings.TrimSpace(self.GetString("cep"))
	PacienteUpdate.Imagem = strings.TrimSpace(self.GetString("urlImagem"))
	PacienteUpdate.Altura, _ = self.GetInt("altura")
	PacienteUpdate.Peso, _ = self.GetFloat("peso")
	PacienteUpdate.Telefone = strings.TrimSpace(self.GetString("telefone"))
	PacienteUpdate.Email = strings.TrimSpace(self.GetString("email"))
	PacienteUpdate.AlteradoEm = time.Now().Unix()
	t, _ := time.Parse(layout, self.GetString("nascimento"))
	PacienteUpdate.Nascimento = t.Unix() + 10800 //Adicionado 3horas para o fuso horário de Brasília
	PacienteUpdate.Estado, _ = self.GetInt8("estado")

	if err := PacienteUpdate.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}

func (self *PacienteController) AjaxDel() {

	Paciente_id, _ := self.GetInt("id")
	Paciente, _ := models.PacienteGetById(Paciente_id)
	Paciente.Estado = 0
	Paciente.Id = Paciente_id

	//TODO Determinar se o grupo deve ser usado temporariamente

	if err := Paciente.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)
}
