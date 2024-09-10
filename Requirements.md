# Requisitos

## Overview

> Você irá criar uma aplicação web para gerenciamento de despesas de cartões corporativos integrados a um BaaS (Banking as a Service), onde os funcionários poderão comprovar e classificar suas despesas.

## RF

  [x] - Cadastro da conta
    - Usuário deve ser capaz de criar uma nova conta, informando os seus `dados pessoais` (``nome``, ``email`` e ``senha``);
  [x] - E os dados da empresa (``nome`` e ``cnpj``). O usuário que criar a conta será definido como administrador dessa conta para a empresa;

  [x] - Perfis de acesso
  - Deverá existir dois perfis de acesso: `Administrador` e `Funcionário`.

  ### Funções do perfil Administrador

  * [x] - Acessar sua conta informado email e senha;
  * [ ] - Visualizar a lista de despesas de todos os cartões de sua empresa;
  * [ ] - Visualizar de forma segmentada as despesas comprovadas, não comprovadas e arquivadas;
  * [ ] - Arquivar despesas ainda não comprovadas;
  * [ ] - Cadastrar, editar e excluir os funcionários dessa empresa. No cadastro deve ser possível informar os dados de nome e email do funcionário. Ao efetuar o cadastro, o funcionário deve receber um email com sua senha de acesso;
  * [ ] - Cadastrar, editar e excluir os cartões corporativos. No cadastro deve ser possível informar os últimos 4 dígitos do cartão. Deve ser possível também associar um cartão a um funcionário;
  * [ ] - Cadastrar, editar e excluir as categorias para classificação das despesas;

  ### Funções do perfil Funcionário

  * [x] - Acessar sua conta informado email e senha. Senha será recebida no email de cadastro;
  * [ ] - Visualizar a lista de despesas dos seus cartões;
  * [ ] - Visualizar de forma segmentada as suas despesas comprovadas e não comprovadas;
  * [ ] - Anexar um comprovante em despesas do seu cartão. Formatos suportados: jpeg, png ou pdf;
  * [ ] - Atualizar comprovante da despesa;
  * [ ] - Associar uma categoria em despesas do seu cartão;
  * [ ] - Atualizar categoria da despesa;

  > As despesas devem ser listadas pela ordem das mais recentes primeiro. A despesa é definida como comprovada, ou de prestação de contas concluída, quando estiver associada um arquivo de comprovação e classificada com uma categoria. Deve haver uma segmentação das despesas comprovadas, não comprovadas, e arquivadas. Nenhuma despesa de cartão poderá ser excluída, porém o administrador terá a possibilidade de arquivar alguma despesa que não necessite de prestação de contas.

   ### A criação das despesas se dará por meio de um webhook integrado ao BaaS.
   A aplicação deve receber a notificação de uma nova compra no cartão no seguinte formato:


    ```json
    // POST /api/baas/webhooks

    {
      "merchant": "Uber *UBER *TRIP",
      "cost": 1790,
      "created_at": "2024-07-04 12:15:52",
      "last4": "1234",
      "transaction_id": "3e85a730-bb1f-451b-9a39-47c55aa054db"
    }

    ```

    #### Observações:

    * [ ] O valor da transação de compra no cartão é recebida como um inteiro. O valor em Reais (R$) é obtido após divisão por 100.
    * [ ] A data e hora da compra no cartão é recebida em UTC. Deve-se ter um cuidado ao apresentar a data e hora de forma correta no timezone da aplicação (preferencialmente no horário de brasília).


Refs
 * [What is Role-Based Access Control (RBAC) and How to Implement it in a Rails API? ](https://auth0.com/blog/what-is-rbac-and-how-to-implement-it-rails-api/)
 * [Role-Based Access Control with Ruby](https://medium.com/@vitalismutwiri/role-based-access-control-with-ruby-e103d45d9df5)
 * [Can Can Can gem](https://github.com/CanCanCommunity/cancancan)
