
ProntMed
====
que?
----
Ferramenta de gerenciamento de API desenvolvida pela golang, baseada no beego, a página é baseada no layUi, a versão atual 1.0.0
demo: http://apiadmin.haodaquan.com
Por favor, entre no grupo para obter o nome de usuário e senha em segundo plano (alguém exclui os dados, não tem como)


Qual é o valor?
----
1. Autoridade RBAC perfeita, sistema de gerenciamento multifuncional
2. Interface de plano de fundo completa, página com várias guias
3. As páginas relacionadas à API têm casos de uso mais complexos
Portanto, pode ser usado como uma estrutura básica para o desenvolvimento rápido. Iniciantes também podem usá-lo como um beego familiar. 
4. Pode ser usado para gerenciamento de API de equipes pequenas e médias 

Quais são usados?
----
1. A estrutura de interface layUI2.4.5  
2、makedown.md   
3、beego1.8
4、Ztree   




método de instalação
----
1.go get github.com/george518/ccb    
2.Crie um banco de dados mysql e importe ppgo_api_admin.sql
3.Modificar o banco de dados de configuração de configuração    
4. Execute go build
5. Execute ./run.sh start|stop


Acesso à recepção: http://your_host:8080
Acesso em segundo plano: http://your_host:8080/login
Nome de usuário: admin Senha: admin 












bee new app
cd app
git init
git add -A.
git commit -m ""
heroku create -b https://github.com/heroku/heroku-buildpack-go.git pront-med
heroku addons:create cleardb:ignite
heroku config
CLEARDB_DATABASE_URL: mysql://b8b93fd3e9d9bd:a1d1ef10@us-cdbr-east-05.cleardb.net/heroku_cb81d5c53a7f0d7?reconnect=true