# Aplicativo Web Audota 

## Instruções para executar
Para a execução do projeto é recomendável que você esteja na versão 3.0.1 do Ruby, utilizando a versão 6.1.3.2 do framework Rails e com o SQLite instalado.

Você pode instala-los através desses links:
* Ruby: https://www.ruby-lang.org/pt/downloads/
* Rails: https://guides.rubyonrails.org/getting_started.html
* SQLite: https://www.sqlite.org/index.html

Crie o arquivo `/config/application.yml` com as seguintes variaveis ambiente:

```
to_email: 'EMAIL_QUE_VAI_RECEBER_NOTIFICACOES_DE_ADOCAO'
gmail_email: 'EMAIL_DO_GMAIL'
gmail_password: 'SENHA_DO_GMAIL'
```

Assim que tudo estiver pronto execute os seguinte comandos para instalar as dependências e subir o banco de dados:
```
bundle install
yarn install
rails db:migrate
rails start
```

Crie um novo adminstrador através do console do rails com o comando `Admin.create(email: 'email@email.test', password: 'password')`.

Em seguida acesse o servidor através do endereço https://localhost:3000