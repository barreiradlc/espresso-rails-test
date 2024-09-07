## Considerações gerais

### Execução da aplicação

Para fazer a aplicação funcionar é necessário dois terminais, e que estejam executando o backend e fron end respetivamente:

```sh

# backend
rails s

# frontend
./bin/shakapacker-dev-server

```

### Estrutura de testes

Os testes da aplicação usam o método de reflexão aplicação sendo que enquanto a aplicação é executada no diretório `/app` os testes por sua vez estão no diretório `/spec`

### TDD

A aplicação segue o TDD que é uma estratégia de desenvilvimento orientado a testes
O ciclo básico do TDD é: Red, Green, Refactor:

Red: Escreva um teste que falhe.
Green: Implemente o código mínimo necessário para fazer o teste passar.
Refactor: Refatore o código, mantendo o teste verde.
