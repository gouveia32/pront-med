/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-08 10:21:13
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-09 18:04:41
***********************************************/
package controllers

import "pront-med/models"

type PrintController struct {
	BaseController
}

func (self *PrintController) Atendimento() {
	paciente_id, _ := self.GetInt("pacienteId", 0)
	if (paciente_id) != 0 {
		paciente, _ := models.PacienteGetById(paciente_id)
		self.Data["paciente"] = paciente
	}

	aId, _ := self.GetInt("aId", 0)
	if (aId) != 0 {
		atendimento, _ := models.AtendimentoGetById(aId)
		self.Data["atendimento"] = atendimento
	}
	self.Data["pageTitle"] = "Impressão de Atendimento"
	//self.display()
	self.TplName = "print/atendimento.html"
}

func (self *PrintController) Nota() {
	paciente_id, _ := self.GetInt("pacienteId", 0)
	if (paciente_id) != 0 {
		paciente, _ := models.PacienteGetById(paciente_id)
		self.Data["paciente"] = paciente
	}
	nId, _ := self.GetInt("nId", 0)
	if (nId) != 0 {
		nota, _ := models.NotaGetById(nId)
		self.Data["nota"] = nota
	}
	self.Data["pageTitle"] = "Impressão de Nota"
	//self.display()
	self.TplName = "print/nota.html"
}
