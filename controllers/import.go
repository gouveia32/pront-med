/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-08 10:21:13
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-09 18:04:41
***********************************************/
package controllers

import (
	"pront-med/models"
	"time"

	"github.com/astaxie/beego"
)

type ImportController struct {
	BaseController
}

func (self *ImportController) Atendimento() {
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
	self.TplName = "import/atendimento.html"
}

func (self *ImportController) Receita() {
	paciente_id, _ := self.GetInt("pacienteId", 0)
	paciente := new(models.Paciente)
	if (paciente_id) != 0 {
		paciente, _ = models.PacienteGetById(paciente_id)
		self.Data["paciente"] = paciente
	}
	modeloId, _ := self.GetInt("modeloId", 0)
	if (modeloId) != 0 {
		modelo, _ := models.ModeloGetById(modeloId)
		campos := models.CampoGetInConteudo(modelo.Detalhe)
		modelo.Campos = campos
		//ajusta campos automáticos como data, paciente, etc...
		for _, v := range modelo.Campos {
			switch v.Nome {
			case "data":
				v.Resposta = time.Now().Format("02 de 01 de 2006")
				break
			case "paciente":
				v.Resposta = paciente.Nome
				break
			case "dia":
				v.Resposta = beego.Date(time.Now(), "d")
				break
			}
		}
		self.Data["Modelo"] = modelo
	}
	self.Data["pageTitle"] = "Montando a receita a partir do modelo"
	//self.display()
	self.TplName = "import/receita.html"
}
