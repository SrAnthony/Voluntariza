# Voluntariza

## Iniciando o servidor

Para esse guia você já deve ter instalado o Ruby na versão `2.5.1` ou superior. Recomendo o [RVM](https://rvm.io/).

1. Clone esse repositório usando `git clone https://github.com/SrAnthony/Voluntariza`
2. Navegue até a pasta com `cd Voluntariza` e digite `bundle install` para a instalação das gems (rails também, caso não tenha instalado).
3. Execute `yarn` para a instalação de pacotes JS
4. Edite o arquivo `config/database.yml` com dados de um BD em mysql (local ou hospedado).
5. Execute `rake db:setup` para criar o banco de dados e as tabelas necessárias.
6. Por fim, execute `rails s` para iniciar o servidor em modo de desenvolvimento.
