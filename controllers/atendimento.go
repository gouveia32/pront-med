/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-09 12:53:05
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-24 18:50:54
***********************************************/
package controllers

import (
	"io/ioutil"
	"path"
	"pront-med/models"
	"strconv"
	"strings"
	"time"

	"github.com/astaxie/beego"
)

type AtendimentoController struct {
	BaseController
}

/* -------------------------------------------------------------------------------
   List
*/
func (self *AtendimentoController) List() {
	self.Data["pageTitle"] = "Atendimento"
	//self.Data["zTree"] = true //Introduzir o ztree
	self.display()
}

/* -------------------------------------------------------------------------------
   Add Paciente
*/
func (self *AtendimentoController) AddPaciente() {
	//self.Data["pageTitle"] = "Novo Atendimento"
	self.Data["uf"] = new(models.Paciente).GetEstados()

	self.display()
}

/* -------------------------------------------------------------------------------
   Edit Paciente
*/
func (self *AtendimentoController) EditPaciente() {
	self.Data["pageTitle"] = "Alterando Paciente"

	self.Data["uf"] = new(models.Paciente).GetEstados()

	id, _ := self.GetInt("paciente_id", 0)
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

/* -------------------------------------------------------------------------------
   GetNode
   obter todos os nós
*/
func (self *AtendimentoController) GetNodes() {

	id := 2
	pid := 1

	paciente_id, _ := self.GetInt("paciente_id", 0)
	pId := strconv.Itoa(paciente_id)
	lstAtend, count := models.AtendimentosGetList(1, 100, " WHERE estado=1 AND paciente_id="+pId)
	list := make([]map[string]interface{}, 0)

	row0 := make(map[string]interface{})
	row0["id"] = 1
	row0["pId"] = 0
	row0["name"] = "Atendimentos"
	list = append(list, row0)

	for _, v := range lstAtend {
		row := make(map[string]interface{})
		row["id"] = id
		row["pId"] = 1
		row["aId"] = v.Id
		row["name"] = beego.Date(time.Unix(v.CriadoEm, 0), "d/m/y") + " " + v.Nome
		pid = id

		list = append(list, row)
		lstNota, count2 := models.NotaGetList(1, 100, " WHERE estado=1 AND atendimento_id="+strconv.Itoa(v.Id))
		if count2 > 0 {
			for _, v2 := range lstNota {
				row2 := make(map[string]interface{})
				row2["pId"] = pid
				id++
				row2["id"] = id
				row2["name"] = v2.Nome
				row2["aId"] = v.Id
				row2["nId"] = v2.Id

				list = append(list, row2)
			}
		}
		id++

	}

	self.display()

	self.ajaxList("sucesso", MSG_OK, count, list)
}

/* -------------------------------------------------------------------------------
   GetNode
*/
func (self *AtendimentoController) GetNode() {

	row := make(map[string]interface{})
	id, _ := self.GetInt("id", 0)
	paciente_id, _ := self.GetInt("pacienteId", 0)
	if paciente_id > 0 {
		models.PacienteChangeNoSelecionado(paciente_id, int64(id))
	}
	// Verifica primeiro se é nota
	n_id, _ := self.GetInt("nId", 0)
	if (n_id) != 0 {
		nota, _ := models.NotaGetById(n_id)
		/* 		if err == nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		} */
		row["id"] = nota.Id
		row["nId"] = nota.Id
		row["aId"] = nota.AtendimentoId
		row["Nome"] = nota.Nome
		row["Conteudo"] = nota.Conteudo
		row["nota"] = nota

		cor, err := models.CorGetById(nota.CorId)
		if err == nil {
			row["Cor"] = "#" + cor.Cor
			row["CorId"] = cor.Id
		} else {
			row["Cor"] = "#fff00"
		}
		row["idAtual"] = id

		self.ajaxList("sucesso", MSG_OK, 0, row)
	} else {
		atendimento_id, _ := self.GetInt("aId", 0)
		atendimento, _ := models.AtendimentoGetById(atendimento_id)
		/* 		if err == nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		} */
		row["id"] = atendimento.Id
		row["aId"] = atendimento.Id
		row["nId"] = 0
		row["Nome"] = atendimento.Nome
		row["Conteudo"] = atendimento.Conteudo
		row["nota"] = atendimento

		row["CorId"] = atendimento.CorId
		cor, err := models.CorGetById(atendimento.CorId)
		if err == nil {
			row["Cor"] = "#" + cor.Cor
			row["CorId"] = cor.Id
		} else {
			row["Cor"] = "#fff00"
		}

		row["idAtual"] = id

		self.ajaxList("sucesso", MSG_OK, 0, row)
	}
}

/* -------------------------------------------------------------------------------
   Edit
*/
func (self *AtendimentoController) Atendimento() {
	self.Data["pageTitle"] = "Atendimento"
	self.Data["zTree"] = true //Introduzir o ztree

	//self.Data["uf"] = new(models.Atendimento).GetEstaos()

	paciente_id, _ := self.GetInt("paciente_id", 0)
	paciente, _ := models.PacienteGetById(paciente_id)
	self.Data["paciente"] = paciente
	corlists := corLists()
	self.Data["corlists"] = corlists

	modelolists := modeloLists()
	self.Data["modelolists"] = modelolists

	self.display()
}

/* -------------------------------------------------------------------------------
   Table
*/
func (self *AtendimentoController) Table() {
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
	BuscaEstado := ""
	switch estado {
	case 0:
		BuscaEstado = "estado=0"
	case 1:
		BuscaEstado = "estado=1"
	}

	self.pageSize = limit
	//Investiga
	//cond := orm.NewCondition()

	cond := ""
	if BuscaEstado != "" {
		cond = "WHERE " + BuscaEstado
	}

	if Busca != "" {
		if cond == "" {
			cond = "WHERE nome LIKE '%" + Busca + "%'"
		} else {
			cond = cond + " AND nome LIKE '%" + Busca + "%'"
		}
	}

	StatusText := make(map[int]string)
	StatusText[0] = "<font color='red'>Inativo</font>"
	StatusText[1] = "Ativo"

	result, count := models.AtendimentoGetList(page, self.pageSize, cond)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["nome"] = v.Nome
		row["qt_atend"] = v.QtAtend
		row["telefone"] = v.Telefone
		row["email"] = v.Email
		row["estado"] = StatusText[int(v.Estado)]

		list[k] = row
	}
	self.ajaxList("sucesso", MSG_OK, int64(count), list)
}

func PdfPage(filePath string) []byte {
	dataByte, _ := ioutil.ReadFile("public/html/pdf.html")
	dataStr := string(dataByte)

	pdfUrl := "/view/pdf?url=" + path.Base(filePath)
	dataStr = strings.Replace(dataStr, "{{url}}", pdfUrl, -1)

	dataByte = []byte(dataStr)
	return dataByte
}

/* -------------------------------------------------------------------------------
   AjaxSave
*/
func (self *AtendimentoController) AjaxSave() {
	id, _ := self.GetInt64("id")
	aId, _ := self.GetInt("aId")
	nId, _ := self.GetInt("nId")
	paciente_id, _ := self.GetInt("paciente_id")

	if id == 0 { //novo
		if aId == 0 { // atendimento
			atendimento := new(models.Atendimento)
			atendimento.Nome = strings.TrimSpace(self.GetString("nome"))
			atendimento.Conteudo = strings.TrimSpace(self.GetString("conteudo"))
			atendimento.CorId, _ = self.GetInt("cor_id")
			atendimento.PacienteId = paciente_id
			atendimento.Estado = 1
			///atendimento.Etiqueta.Cor.Id, _ = self.GetInt("cor_id")
			atendimento.CriadoEm = time.Now().Unix()
			if _, err := models.AtendimentoAdd(atendimento); err != nil {
				self.ajaxMsg(err.Error(), MSG_ERR)
			}
			models.PacienteChangeNoSelecionado(paciente_id, 2)
			self.ajaxMsg("", MSG_OK)
		} else { // Nota
			nota := new(models.Nota)
			nota.Nome = strings.TrimSpace(self.GetString("nome"))
			nota.Conteudo = strings.TrimSpace(self.GetString("conteudo"))
			nota.CorId, _ = self.GetInt("cor_id")
			nota.AtendimentoId = aId
			nota.Estado = 1
			///nota.Etiqueta.Cor.Id, _ = self.GetInt("cor_id")
			nota.CriadoEm = time.Now().Unix()
			if _, err := models.NotaAdd(nota); err != nil {
				self.ajaxMsg(err.Error(), MSG_ERR)
			}
			//models.PacienteChangeNoSelecionado(paciente_id, int64(aId))
			self.ajaxMsg("", MSG_OK)
		}
	}

	models.PacienteChangeNoSelecionado(paciente_id, id) //guarda o id_atual em paciente
	//Alterações
	if nId != 0 {
		Nota, _ := models.NotaGetById(nId)
		Nota.Nome = strings.TrimSpace(self.GetString("nome"))
		Nota.Conteudo = strings.TrimSpace(self.GetString("conteudo"))
		Nota.CorId, _ = self.GetInt("cor_id")
		Nota.AlteradoEm = time.Now().Unix()

		if err := Nota.Update(); err != nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}

		self.ajaxMsg("", MSG_OK)
	}

	if aId != 0 { //Alterar Atendimento
		Atendimento, _ := models.AtendimentoGetById(aId)

		Atendimento.Nome = strings.TrimSpace(self.GetString("nome"))
		Atendimento.Conteudo = strings.TrimSpace(self.GetString("conteudo"))
		Atendimento.CorId, _ = self.GetInt("cor_id")
		Atendimento.AlteradoEm = time.Now().Unix()

		if err := Atendimento.Update(); err != nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}

		self.ajaxMsg("", MSG_OK)
	}

}

/* -------------------------------------------------------------------------------
   AjaxDel
*/
func (self *AtendimentoController) AjaxDel() {

	n_id, _ := self.GetInt("n_Id")

	if n_id != 0 {
		Nota, _ := models.NotaGetById(n_id)
		Nota.Estado = 0
		if err := Nota.Update(); err != nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}
		self.ajaxMsg("", MSG_OK)
	}

	a_id, _ := self.GetInt("a_Id")

	if a_id != 0 {
		Atendimento, err := models.AtendimentoGetById(a_id)
		if err == nil {
			Atendimento.Estado = 0
			if err := Atendimento.Update(); err != nil {
				self.ajaxMsg(err.Error(), MSG_ERR)
			}
			//apaga todas notas associada a este atendimento
			lstNota, cnt := models.NotaGetList(1, 100, " WHERE estado=1 AND atendimento_id="+strconv.Itoa(Atendimento.Id))
			if cnt > 0 {
				for _, n := range lstNota {
					n.Estado = 0
					n.Update()
				}
			}
			self.ajaxMsg("", MSG_OK)

		} else {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}

	}

}
