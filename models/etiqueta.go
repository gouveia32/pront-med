/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-16 15:42:43
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-24 11:48:17
***********************************************/
package models

import (
	"github.com/astaxie/beego/orm"
)

type Etiqueta struct {
	Id     int
	Nome   string
	Estado int
	Cor    *Cor `orm:"rel(one)"` // OneToOne relation
}

func (a *Etiqueta) TableName() string {
	return TableName("etiqueta")
}

func EtiquetaAdd(a *Etiqueta) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func EtiquetaGetByName(etiquetaName string) (*Etiqueta, error) {
	a := new(Etiqueta)
	err := orm.NewOrm().QueryTable(TableName("etiqueta")).Filter("etiqueta", etiquetaName).One(a)
	if err != nil {
		return nil, err
	}
	return a, nil
}

func EtiquetaGetList(page, pageSize int, filters ...interface{}) ([]*Etiqueta, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Etiqueta, 0)
	query := orm.NewOrm().QueryTable(TableName("etiqueta"))
	if len(filters) > 0 {
		l := len(filters)
		for k := 0; k < l; k += 2 {
			query = query.Filter(filters[k].(string), filters[k+1])
		}
	}
	total, _ := query.Count()
	query.OrderBy("-id").Limit(pageSize, offset).All(&list)
	return list, total
}

func EtiquetaGetById(id int) (*Etiqueta, error) {
	r := new(Etiqueta)
	err := orm.NewOrm().QueryTable(TableName("etiqueta")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	c := new(Cor)
	orm.NewOrm().QueryTable(TableName("cor")).Filter("id", r.Cor.Id).One(c)
	r.Cor = c

	return r, nil
}

func (a *Etiqueta) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(a, fields...); err != nil {
		return err
	}
	return nil
}
