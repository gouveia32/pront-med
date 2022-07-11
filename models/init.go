/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-08 00:18:02
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-16 17:26:48
***********************************************/

package models

import (
	"net/url"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

func Init() {
	//time.Local, _ = time.LoadLocation("America/Sao_Paulo")

	dbhost := beego.AppConfig.String("db.host")
	dbport := beego.AppConfig.String("db.port")
	dbuser := beego.AppConfig.String("db.user")
	dbpassword := beego.AppConfig.String("db.password")
	dbname := beego.AppConfig.String("db.name")
	timezone := beego.AppConfig.String("db.timezone")
	if dbport == "" {
		dbport = "3306"
	}
	dsn := dbuser + ":" + dbpassword + "@tcp(" + dbhost + ":" + dbport + ")/" + dbname + "?charset=utf8&parseTime=true"
	//fmt.Println("dsn=",dsn)

	if timezone != "" {
		dsn = dsn + "&loc=" + url.QueryEscape(timezone)
	}

	//maxIdle, _ := beego.AppConfig.Int("maxIdle")
	//maxConn, _ := beego.AppConfig.Int("maxConn")

	orm.RegisterDriver("mysql", orm.DRMySQL)
	//orm.RegisterDataBase("default", "mysql", dsn, 30)
	orm.RegisterDataBase("default", "mysql", dsn)
	orm.RegisterModel(new(Auth), new(Role), new(RoleAuth), new(Admin),
		new(Group), new(Cor), new(Env), new(Code), new(ApiSource), new(ApiDetail), new(ApiPublic), new(Template), new(Paciente),
		new(Etiqueta), new(Nota), new(Atendimento), new(EtiquetaNota), new(Modelo), new(Campo))

	if beego.AppConfig.String("runmode") == "dev" {
		orm.Debug = true
	}

	orm.RunSyncdb("default", false, false)
}

func TableName(name string) string {
	return beego.AppConfig.String("db.prefix") + name
}
