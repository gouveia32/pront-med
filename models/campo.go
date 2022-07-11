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
	"strings"
)

type Campo struct {
	Id        int
	Modelo    *Modelo `orm:"rel(fk)"`
	Nome      string
	Descricao string
	Resposta  string
}

func (a *Campo) TableName() string {
	return TableName("campo")
}

func CampoAdd(a *Campo) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func CampoGetByNome(nome string) (*Campo, error) {
	r := new(Campo)
	err := orm.NewOrm().QueryTable(TableName("campo")).Filter("nome", nome).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}


func CampoGetInConteudo(conteudo string) ([]*Campo) {
	list := make([]*Campo, 0)

	words := strings.Split(conteudo, "]]")
	for _, word := range words {
		subwords := strings.Split(word, "[[")
		if len(subwords) > 1 {
			w := subwords[1]
			campo,_ := CampoGetByNome(w)
			if campo != nil {
				list = append(list, campo)
			} else {
				campo := new(Campo)
				campo.Nome = w
				list = append(list, campo)
			}
		} 
	}
	
	return list
}


func CampoGetList(page, pageSize int, filters ...interface{}) ([]*Campo, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Campo, 0)
	query := orm.NewOrm().QueryTable(TableName("campo"))
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

func CampoGetById(id int) (*Campo, error) {
	r := new(Campo)
	err := orm.NewOrm().QueryTable(TableName("campo")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}

func (a *Campo) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(a, fields...); err != nil {
		return err
	}
	return nil
}
