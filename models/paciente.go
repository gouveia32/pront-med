/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-16 15:42:43
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-24 11:48:17
***********************************************/
package models

import (
	"fmt"

	"github.com/astaxie/beego/orm"
)

type Paciente struct {
	Id            int
	Nome          string
	Sexo          string
	Nascimento    int64
	Email         string
	Telefone      string
	Logradoro     string
	Numero        string
	Bairro        string
	Municipio     string
	Uf            string
	Cep           string
	Altura        int
	Peso          float64
	Imagem        string
	CriadoEm      int64
	AlteradoEm    int64
	NoSelecionado int
	Estado        int8
}

func (a *Paciente) TableName() string {
	return TableName("paciente")
}

// GetEstados
func (*Paciente) GetEstados() []string {
	return []string{"SE", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PR", "PB", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "PA", "TO"}
}

func PacienteAdd(a *Paciente) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func PacienteGetByName(Nome string) (*Paciente, error) {
	a := new(Paciente)
	err := orm.NewOrm().QueryTable(TableName("paciente")).Filter("nome", Nome).One(a)
	if err != nil {
		return nil, err
	}
	return a, nil
}

func PacienteGetList(page, pageSize int, cond *orm.Condition) ([]*Paciente, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Paciente, 0)
	query := orm.NewOrm().QueryTable(TableName("paciente"))
	query = query.SetCond(cond)
	total, _ := query.Count()
	query.OrderBy("-id").Limit(pageSize, offset).All(&list)
	return list, total
}

func PacienteGetById(id int) (*Paciente, error) {
	r := new(Paciente)
	err := orm.NewOrm().QueryTable(TableName("paciente")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}

func (a *Paciente) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(a, fields...); err != nil {
		return err
	}
	return nil
}

func PacienteChangeNoSelecionado(id int, no int64) (num int64, err error) {

	sql := fmt.Sprintf("UPDATE paciente set no_selecionado=? where id = %d;", id)
	res, err := orm.NewOrm().Raw(sql, no).Exec()
	num = 0
	if err == nil {
		num, _ = res.RowsAffected()
	}
	return num, err
}
