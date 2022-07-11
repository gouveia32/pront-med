/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-16 15:42:43
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-10-09 11:48:17
***********************************************/
package models

import (
	"github.com/astaxie/beego/orm"
)

type Atendimento struct {
	Id         int
	PacienteId int
	Nome       string
	Conteudo   string
	//Cor         *Cor `orm:"rel(one)"` // OneToOne relation
	CorId       int
	Estado      int
	CriadorId   int
	AlteradorId int
	CriadoEm    int64
	AlteradoEm  int64
	Etiquetas   []*Etiqueta `orm:"rel(m2m);rel_through(pront-med/models.EtiquetaNota)"`
}

type NotaList struct {
	Id            int
	NotaNome      string
	EtiquetaLists []*EtiquetaList
}

type EtiquetaList struct {
	Id           int
	Method       int
	EtiquetaNome string
}

type PacienteAtend struct {
	Id       int
	Nome     string
	Email    string
	Telefone string
	Estado   int
	QtAtend  int
}

func NotaTreeData(pacienteId int) ([]*NotaList, error) {
	list := make([]*NotaList, 0)
	sql := "SELECT id, nome FROM nota WHERE paciente_id=?"
	orm.NewOrm().Raw(sql, pacienteId).QueryRows(&list)
	etiquetaList := make([]*NotaList, 0)
	for _, nota := range list {
		atendList := make([]*EtiquetaList, 0)
		atend_sql := "SELECT id,nome FROM atendimento WHERE nota_id=? AND estado=1"
		orm.NewOrm().Raw(atend_sql, nota.Id).QueryRows(&atendList)
		nota.EtiquetaLists = atendList
		etiquetaList = append(etiquetaList, nota)
	}
	return etiquetaList, nil
}

func (a *Atendimento) TableName() string {
	return TableName("atendimento")
}

func AtendimentoGetById(id int) (*Atendimento, error) {
	r := new(Atendimento)
	err := orm.NewOrm().QueryTable(TableName("atendimento")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}

func AtendimentoGetByPacienteId(paciente_id int) ([]*Atendimento, int) {
	list := make([]*Atendimento, 0)
	sql := "SELECT * FROM atendimento WHERE paciente_id=?"

	orm.NewOrm().Raw(sql, paciente_id).QueryRows(&list)

	total := len(list)
	return list, total
}

func AtendimentosGetById(id int) ([]*Atendimento, error) {
	list := make([]*Atendimento, 0)
	sql := "SELECT api_detail.*,a.real_name as create_name,b.real_name as update_name,c.real_name as audit_name FROM api_detail LEFT JOIN uc_admin as a ON api_detail.create_id=a.id  LEFT JOIN uc_admin as b ON api_detail.update_id=b.id LEFT JOIN uc_admin as c ON api_detail.audit_id=c.id WHERE atendimento.nota_id=?"
	orm.NewOrm().Raw(sql, id).QueryRows(&list)

	return list, nil
}

func AtendimentoGetList(page, pageSize int, where string) ([]*PacienteAtend, int64) {
	offset := (page - 1) * pageSize
	list := make([]*PacienteAtend, 0)
	sql := "SELECT id, nome, email, telefone, (SELECT COUNT(*) FROM atendimento AS a WHERE a.paciente_id = p.id  AND estado=1) AS qt_atend, estado FROM paciente AS p " +
		where + " ORDER BY p.id DESC LIMIT ?,?;"

	orm.NewOrm().Raw(sql, offset, pageSize).QueryRows(&list)

	total := len(list)
	return list, int64(total)
}

func AtendimentoGetListO(page, pageSize int, filters ...interface{}) ([]*Atendimento, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Atendimento, 0)
	query := orm.NewOrm().QueryTable(TableName("atendimento"))
	if len(filters) > 0 {
		l := len(filters)
		for k := 0; k < l; k += 2 {
			query = query.Filter(filters[k].(string), filters[k+1])
		}
	}
	total, _ := query.Count()
	query.OrderBy("id").Limit(pageSize, offset).All(&list)

	return list, total
}

func AtendimentosGetList(page, pageSize int, where string) ([]*Atendimento, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Atendimento, 0)
	sql := "SELECT * FROM atendimento " +
		where + " ORDER BY id DESC LIMIT ?,?;"

	orm.NewOrm().Raw(sql, offset, pageSize).QueryRows(&list)

	total := len(list)
	return list, int64(total)
}

func AtendimentoAdd(a *Atendimento) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func (a *Atendimento) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(a, fields...); err != nil {
		return err
	}
	return nil
}

func AtendimentoChangeStatus(ids string, estado int) (num int64, err error) {

	sql := "UPDATE atendimento set estado=? where id in (" + ids + ")"
	res, err := orm.NewOrm().Raw(sql, estado).Exec()
	num = 0
	if err == nil {
		num, _ = res.RowsAffected()
	}
	return num, err
}
