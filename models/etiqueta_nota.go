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

type EtiquetaNota struct {
	Id        int64
	Nota      *Nota     `orm:"rel(fk)"`
	Etiqueta  *Etiqueta `orm:"rel(fk)"`
	CreatedAt int64
	UpdatedAt int64
}

func EtiquetaNotaGetList(filters ...interface{}) []*EtiquetaNota {
	list := make([]*EtiquetaNota, 0)
	query := orm.NewOrm().QueryTable(TableName("etiqueta_nota"))
	if len(filters) > 0 {
		l := len(filters)
		for k := 0; k < l; k += 2 {
			query = query.Filter(filters[k].(string), filters[k+1])
		}
	}
	query.OrderBy("id").All(&list)
	return list
}

func EtiquetaNotaGetById(nota_id int64, etiqueta_id int64) (*EtiquetaNota, error) {
	r := new(EtiquetaNota)
	err := orm.NewOrm().QueryTable(TableName("etiqueta_nota")).Filter("nota_id", nota_id).Filter("etiqueta_id", etiqueta_id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}

func (a *EtiquetaNota) TableName() string {
	return TableName("etiqueta_nota")
}
