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

type Cor struct {
	Id       int
	Nome     string
	Cor      string
	Estado   int8
	Etiqueta *Etiqueta `orm:"reverse(one)"` // Reverse relationship (optional)
}

func (a *Cor) TableName() string {
	return TableName("cor")
}

func CorAdd(a *Cor) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func CorGetByName(corName string) (*Cor, error) {
	a := new(Cor)
	err := orm.NewOrm().QueryTable(TableName("cor")).Filter("cor", corName).One(a)
	if err != nil {
		return nil, err
	}
	return a, nil
}

func CorGetList(page, pageSize int, filters ...interface{}) ([]*Cor, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Cor, 0)
	query := orm.NewOrm().QueryTable(TableName("cor"))
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

func CorGetById(id int) (*Cor, error) {
	r := new(Cor)
	err := orm.NewOrm().QueryTable(TableName("cor")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}

func (a *Cor) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(a, fields...); err != nil {
		return err
	}
	return nil
}
