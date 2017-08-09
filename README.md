Desafio back-end AMARO
==========================

## Sobre o desafio

### Criação de API para cadastro e consulta de produtos 

Você precisa criar uma API com os seguintes requisitos:

#### End-point para inserção de dados

* O cliente poderá enviá-los em arquivos json ou xml e a API
deverá inserir no banco de dados.
* Escolha o banco de dados que achar melhor.

#### End-point para consulta destes produtos

* Pode ser consultado por: id, nome ou tags. Caso a consulta seja por uma tag ou nome, 
deverá listar todos os produtos com aquela respectiva busca, poderá ser feito em um ou mais end-points.

#### Requisitos Obrigatórios

* Ter uma cobertura de teste relativamente boa, a maior que você conseguir.
* Usar PHP
* Pode usar qualquer framework PHP para o desenvolvimento ou não usar nenhum, fica a sua escolha.
* Criar um cache para consulta.


#### PLUS - Não necessário

* Colocar uma autenticação JWT.
* Usar PHP 7.1

## Orientações
* Procure fazer uma API sucinta. 
* Os arquivos (json, xml) junto com o formato que o cliente irá enviar estão no repositório.
* Pensa em escalabilidade, pode ser uma quantidade muito grande de dados.
* Coloque isso em um repositório GIT.
* Colocar as orientações de setup no README do seu repositório.

# Boa sorte 