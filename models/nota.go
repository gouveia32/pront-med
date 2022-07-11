/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-16 15:42:43
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-24 11:48:17
***********************************************/
package models

import (

	//"database/sql"

	"github.com/astaxie/beego/orm"
)

type Nota struct {
	Id            int
	AtendimentoId int
	Nome          string
	//Cor           *Cor `orm:"rel(one)"` // OneToOne relation
	Conteudo      string
	CorId		int
	CriadoEm      int64
	AlteradoEm    int64
	Estado        int8
	//User *User `orm:"rel(fk)"`//Set up a one-to-many relationship
	//Etiquetas []*Etiqueta `orm:"rel(m2m)"`
	Etiquetas []*Etiqueta `orm:"rel(m2m);rel_through(pront-med/models.EtiquetaNota)"`
}

func (a *Nota) TableName() string {
	return TableName("nota")
}

// GetEstados
func (*Nota) GetEstados() []string {
	return []string{"SE", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PR", "PB", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "PA", "TO"}
}

func NotaAdd(a *Nota) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func NotaGetByName(Nome string) (*Nota, error) {
	a := new(Nota)
	err := orm.NewOrm().QueryTable(TableName("nota")).Filter("nome", Nome).One(a)
	if err != nil {
		return nil, err
	}
	return a, nil
}

func NotaGetList(page, pageSize int, where string) ([]*Nota, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Nota, 0)
	sql := "SELECT * FROM nota " +
		where + " ORDER BY id LIMIT ?,?;"

	orm.NewOrm().Raw(sql, offset, pageSize).QueryRows(&list)

	total := len(list)
	return list, int64(total)
}

func NotaGetById(id int) (*Nota, error) {
	r := new(Nota)
	err := orm.NewOrm().QueryTable(TableName("nota")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}

func (a *Nota) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(a, fields...); err != nil {
		return err
	}
	return nil
}
