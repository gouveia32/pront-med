package routers

import (
	"pront-med/controllers"

	"github.com/astaxie/beego"
)

func init() {
	//login padrão
	beego.Router("/", &controllers.ApiDocController{}, "*:Index")
	beego.Router("/login", &controllers.LoginController{}, "*:LoginIn")
	beego.Router("/login_out", &controllers.LoginController{}, "*:LoginOut")
	beego.Router("/no_auth", &controllers.LoginController{}, "*:NoAuth")

	beego.Router("/home", &controllers.HomeController{}, "*:Index")
	beego.Router("/home/start", &controllers.HomeController{}, "*:Start")
	beego.Router("/upload", &controllers.UploadController{}, "*:UpFile")

	beego.Router("/print/atendimento", &controllers.PrintController{}, "*:Atendimento")
	beego.Router("/print/nota", &controllers.PrintController{}, "*:Nota")
	beego.Router("/import/receita", &controllers.ImportController{}, "*:Receita")

	beego.AutoRouter(&controllers.ApiController{})
	beego.AutoRouter(&controllers.ApiSourceController{})
	beego.AutoRouter(&controllers.ApiPublicController{})
	beego.AutoRouter(&controllers.TemplateController{})
	beego.AutoRouter(&controllers.ModeloController{})
	beego.AutoRouter(&controllers.CampoController{})
	beego.AutoRouter(&controllers.ApiDocController{})

	beego.AutoRouter(&controllers.EnvController{})
	beego.AutoRouter(&controllers.CodeController{})
	beego.AutoRouter(&controllers.PacienteController{})
	beego.AutoRouter(&controllers.CorController{})
	beego.AutoRouter(&controllers.EtiquetaController{})
	beego.AutoRouter(&controllers.NotaController{})

	beego.AutoRouter(&controllers.AtendimentoController{})

	beego.AutoRouter(&controllers.GroupController{})
	beego.AutoRouter(&controllers.AuthController{})
	beego.AutoRouter(&controllers.RoleController{})
	beego.AutoRouter(&controllers.AdminController{})
	beego.AutoRouter(&controllers.UserController{})

}
