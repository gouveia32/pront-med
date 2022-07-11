/**********************************************
** @Des: 管理员
** @Author: haodaquan
** @Date:   2017-09-16 14:17:37
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-17 11:14:07
***********************************************/
package controllers

import (
	"fmt"
	"pront-med/libs"
	"pront-med/models"
	"strconv"
	"strings"
	"time"

	"github.com/astaxie/beego"
)

type AdminController struct {
	BaseController
}

func (self *AdminController) List() {
	self.Data["pageTitle"] = "Gerenciamento de administrador"
	self.display()
	//self.TplName = "admin/list.html"
}

func (self *AdminController) Add() {
	self.Data["pageTitle"] = "Novo administrador"

	// 角色
	filters := make([]interface{}, 0)
	filters = append(filters, "status", 1)
	result, _ := models.RoleGetList(1, 1000, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["role_name"] = v.RoleName
		list[k] = row
	}

	self.Data["role"] = list

	self.display()
}

func (self *AdminController) Edit() {
	self.Data["pageTitle"] = "Editar administrador"

	id, _ := self.GetInt("id", 0)
	Admin, _ := models.AdminGetById(id)
	row := make(map[string]interface{})
	row["id"] = Admin.Id
	row["login_name"] = Admin.LoginName
	row["real_name"] = Admin.RealName
	row["phone"] = Admin.Phone
	row["email"] = Admin.Email
	row["role_ids"] = Admin.RoleIds
	self.Data["admin"] = row

	role_ids := strings.Split(Admin.RoleIds, ",")

	filters := make([]interface{}, 0)
	filters = append(filters, "status", 1)
	result, _ := models.RoleGetList(1, 1000, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["checked"] = 0
		for i := 0; i < len(role_ids); i++ {
			role_id, _ := strconv.Atoi(role_ids[i])
			if role_id == v.Id {
				row["checked"] = 1
			}
			fmt.Println(role_ids[i])
		}
		row["id"] = v.Id
		row["role_name"] = v.RoleName
		list[k] = row
	}
	self.Data["role"] = list
	self.display()
}

func (self *AdminController) AjaxSave() {
	Admin_id, _ := self.GetInt("id")
	if Admin_id == 0 {
		Admin := new(models.Admin)
		Admin.LoginName = strings.TrimSpace(self.GetString("login_name"))
		Admin.RealName = strings.TrimSpace(self.GetString("real_name"))
		Admin.Phone = strings.TrimSpace(self.GetString("phone"))
		Admin.Email = strings.TrimSpace(self.GetString("email"))
		Admin.RoleIds = strings.TrimSpace(self.GetString("roleids"))
		Admin.UpdateTime = time.Now().Unix()
		Admin.UpdateId = self.userId
		Admin.Status = 1

		// Verifique se o login já existe
		_, err := models.AdminGetByName(Admin.LoginName)

		if err == nil {
			self.ajaxMsg("Login já existente", MSG_ERR)
		}
		//Novo
		pwd, salt := libs.Password(4, "")
		Admin.Password = pwd
		Admin.Salt = salt
		Admin.CreateTime = time.Now().Unix()
		Admin.CreateId = self.userId
		if _, err := models.AdminAdd(Admin); err != nil {
			self.ajaxMsg(err.Error(), MSG_ERR)
		}
		self.ajaxMsg("", MSG_OK)
	}

	Admin, _ := models.AdminGetById(Admin_id)
	//修改
	Admin.Id = Admin_id
	Admin.UpdateTime = time.Now().Unix()
	Admin.UpdateId = self.userId
	Admin.LoginName = strings.TrimSpace(self.GetString("login_name"))
	Admin.RealName = strings.TrimSpace(self.GetString("real_name"))
	Admin.Phone = strings.TrimSpace(self.GetString("phone"))
	Admin.Email = strings.TrimSpace(self.GetString("email"))
	Admin.RoleIds = strings.TrimSpace(self.GetString("roleids"))
	Admin.UpdateTime = time.Now().Unix()
	Admin.UpdateId = self.userId
	Admin.Status = 1

	resetPwd, _ := self.GetInt("reset_pwd")
	if resetPwd == 1 {
		pwd, salt := libs.Password(4, "")
		Admin.Password = pwd
		Admin.Salt = salt
	}
	if err := Admin.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg(strconv.Itoa(resetPwd), MSG_OK)
}

func (self *AdminController) AjaxDel() {

	Admin_id, _ := self.GetInt("id")
	status := strings.TrimSpace(self.GetString("status"))
	if Admin_id == 1 {
		self.ajaxMsg("Super administrador não permite operação", MSG_ERR)
	}

	Admin_status := 0
	if status == "enable" {
		Admin_status = 1
	}
	Admin, _ := models.AdminGetById(Admin_id)
	Admin.UpdateTime = time.Now().Unix()
	Admin.Status = Admin_status
	Admin.Id = Admin_id

	if err := Admin.Update(); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("Operação bem-sucedida", MSG_OK)
}

func (self *AdminController) Table() {
	//Lista
	page, err := self.GetInt("page")
	if err != nil {
		page = 1
	}
	limit, err := self.GetInt("limit")
	if err != nil {
		limit = 30
	}

	realName := strings.TrimSpace(self.GetString("realName"))

	StatusText := make(map[int]string)
	StatusText[0] = "<font color='red'>Inativo</font>"
	StatusText[1] = "Ativo"

	self.pageSize = limit
	//Investigar条件
	filters := make([]interface{}, 0)
	//
	if realName != "" {
		filters = append(filters, "real_name__icontains", realName)
	}
	result, count := models.AdminGetList(page, self.pageSize, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["login_name"] = v.LoginName
		row["real_name"] = v.RealName
		row["phone"] = v.Phone
		row["email"] = v.Email
		row["role_ids"] = v.RoleIds
		row["create_time"] = beego.Date(time.Unix(v.CreateTime, 0), "Y-m-d H:i:s")
		row["update_time"] = beego.Date(time.Unix(v.UpdateTime, 0), "Y-m-d H:i:s")
		row["status"] = v.Status
		row["status_text"] = StatusText[v.Status]
		list[k] = row
	}
	self.ajaxList("成功", MSG_OK, count, list)
}
