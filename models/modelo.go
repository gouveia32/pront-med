/**********************************************
** @Des: markdown模板
** @Author: haodaquan
** @Date:   2018-01-16 15:42:43
** @Last Modified by:   haodaquan
** @Last Modified time: 2018-01-16 11:48:17
***********************************************/
package models

import (
	"time"

	"github.com/astaxie/beego/orm"
)

type Modelo struct {
	Id          int
	Nome        string
	Detalhe     string
	Estado      int
	CriadorId   int
	AlteradorId int
	CriadoEm    int64
	AlteradoEm  int64
	Campos      []*Campo `orm:"reverse(many)"`
}

func (a *Modelo) TableName() string {
	return TableName("modelo")
}

func ModeloGetList(page, pageSize int, filters ...interface{}) ([]*Modelo, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Modelo, 0)
	query := orm.NewOrm().QueryTable(TableName("modelo"))
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


func ModeloAdd(a *Modelo) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func ModeloGetById(id int) (Modelo, error) {
	var modelo Modelo
	query := orm.NewOrm().QueryTable(TableName("modelo"))
	query.Filter("id", id).Filter("estado", 1).One(&modelo)
	list := make([]*Campo, 0)
	query = orm.NewOrm().QueryTable(TableName("campo"))
	query.Filter("modelo_id", id).All(&list)

	//fmt.Println("campos: ", list[0].Nome)   "Y-m-d H:i:s"

	modelo.Campos = list

	return modelo, nil
}

func (a *Modelo) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(a, fields...); err != nil {
		return err
	}
	return nil
}

func (a *Modelo) Delete(id int64, alterador_id int) (int64, error) {
	sql := "UPDATE modelo SET estado=0,alterador_id=?,alterado_em=? WHERE id=?"
	res, err := orm.NewOrm().Raw(sql, alterador_id, time.Now().Unix(), id).Exec()
	if err == nil {
		num, _ := res.RowsAffected()
		return num, nil
	}
	return 0, err
}
