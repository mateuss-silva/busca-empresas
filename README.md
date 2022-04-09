## 📱Escopo de projeto

### Especificações

- Login e acesso de Usuário já registrado com padrões OAuth 2.0 (Na resposta de sucesso do login a api retornará 3 custom headers (access-token, client, uid);
- Busca de Empresas
- Listagem de Empresas
- Detalhamento de Empresas
- **OBS:** Para ter acesso as demais APIS precisamos enviar esses 3 custom headers para a API autorizar a requisição;

## Arquitetura padrões e utilizados

- Princípios SOLID;
- **Gerenciamento de estados:** FlutterBloc orientado a eventos;
- **Gerenciamento de rotas:** Flutter Modular;
- **Injeção de dependências:** Flutter Modular;
- **Padrão de projeto**
  - Publish-Subscribe
  - Singleton
  - ViewModel
  - MVC

## Dados para Teste

- Usuário de Teste: testeapple@ioasys.com.br
- Senha de Teste : 12341234
