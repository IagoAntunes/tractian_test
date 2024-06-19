# TRACTIAN Test

:iphone::large_blue_circle: Mobile Software Engineer test

Os ativos são essenciais para o funcionamento da indústria e podem incluir desde equipamentos de fabricação até veículos de transporte e sistemas de geração de energia. O gerenciamento e a manutenção adequados são cruciais para garantir que eles continuem a operar de forma eficiente e eficaz. Uma forma prática de visualizar a hierarquia dos ativos é através de uma estrutura em árvore.

### Desafio

📌 **Build a Tree View Application that shows companies Assets.**

A árvore é composta basicamente por componentes, ativos e localizações.

## Introdução

<details>
<summary>Clique para Expandir!</summary>

Bem-vindo ao projeto Tree View Application! Este projeto foi desenvolvido como parte de um desafio técnico para construir uma aplicação que exibe os ativos das empresas em uma estrutura hierárquica de árvore. A visualização dos ativos em forma de árvore facilita a compreensão da relação entre localizações, ativos e componentes, permitindo uma gestão mais eficiente e eficaz dos recursos industriais.

Nesta aplicação, você poderá:

- Visualizar a hierarquia dos ativos em uma estrutura de árvore.
- Filtrar ativos com base em diferentes critérios, como status, texto, qrCode.
- Armazenar e recuperar dados de ativos localmente para suportar o funcionamento offline.
- Visualizar os status dos ativos de uma unidade

A seguir, você encontrará as instruções para instalação, uso e para este projeto.

</details>

## Installation

<details>
<summary>Clique para Expandir!</summary>

To install this project, follow these steps:

1. Clone the repository:
    ```sh
    git clone https://github.com/IagoAntunes/tractian_test.git
    ```
2. Install the dependencies:
    ```sh
    flutter pub get
    ```
3. Run:
    ```sh
    flutter run
    ```
</details>

## Tecnologias e Ferramentas

<details>
<summary>Clique para Expandir!</summary>

### Tecnologias 
- Flutter

### Ferramentas
- [GetX](https://pub.dev/packages/get) - Utilizado para gerenciamento de estado, navegação, injeção de dependencias.
- [dio](https://pub.dev/packages/dio) - Package utilizado para realizar consultas(não foi usado por os dados estarem mockados).
- [get_storage](https://pub.dev/packages/get_storage) - Package utilizado para armazenamento de dados permitindo o uso offline do aplicativo.
- [internet_connection_checker](https://pub.dev/packages/internet_connection_checker) - Utilizado para verificar se o usuário possui conexão com internet.
- [qr_code_scanner](https://pub.dev/packages/qr_code_scanner) - Utilizado para ler dados de um QrCode e filtrar os ativos.
- [path_provider](https://pub.dev/packages/path_provider) - Utilizado para consultar dados mockados na pasta assets, tornando a consulta em tempo de execução dinamica sem dados fixos.

</details>

## Testes Unitarios

<details>
<summary>Clique para Expandir!</summary>

```Coverage é uma métrica que indica quantas linhas de código, instruções, condições ou caminhos do programa são testados pelo conjunto de testes unitários.```

**Coverage:** 81,2%

Os testes de unidade são usados para testar unidades individuais de código. No Flutter, os testes de unidade são escritos usando a biblioteca `flutter_test`, com auxilio de outras bibliotecas [**mocktail**](https://pub.dev/packages/mocktail)

Para executar os testes de unidade, siga estas etapas:

```dart
flutter test
```

</details>

## Arquitetura

<details>
<summary>Clique para Expandir!</summary>
  
Este projeto utiliza a **Clean Architecture** para organizar o código de maneira modular e desacoplada, facilitando a manutenção e evolução do sistema. A estrutura de pastas está organizada da seguinte forma:

### Estrutura de Pastas

```
lib
│
├── core
│
├── features
|
├── settings

```

- **domain:** Contem os códigos e regras que são compartilhadas entre as funcionalidades do aplicativo.
- **features** Contem os códigos de cada funcionalidade.
- **settings** Contem configuração de tema como estilo de cores,textos alem de injeção de dependencia.

```
features
│
├── domain
│ ├── entities
│ ├── models
│ ├── repositories
│ └── requests
│ └── responses
│
├── external
│ ├── datasources
│ └── dao
│
├── infra
│ ├── repositories
│ └── datasources
│ └── dao
│
└── presentation
├── controllers
├── pages
└── widgets
```
- **domain:** Contém as abstrações do repositório e modelos (entities) que representam os dados fundamentais da aplicação.
  - `entities:` Modelos que representam os dados.
  - `repositories:` Interfaces dos repositórios.
  - `usecases:` Casos de uso que representam as regras de negócio da aplicação.

- **external:** Responsável pela implementação das fontes de dados externas e objetos de acesso a dados (DAO).
  - `datasources:` Implementação de fontes de dados externas, como APIs.
  - `dao:` Objetos de acesso a dados para armazenamento local.

- **infra:** Contém a implementação dos repositórios e abstrações das fontes de dados.
  - `repositories:` Implementação das interfaces de repositórios definidas no domínio.
  - `datasources:` Interfaces das fontes de dados externas.

- **presentation:** Contém os códigos relacionados à interface do usuário (UI) e controladores.
  - `controllers:` Controladores que gerenciam a lógica de apresentação.
  - `pages:` Páginas da aplicação.
  - `widgets:` Componentes reutilizáveis da UI.

### Abstração de Pacotes

Para evitar acoplamento do código a pacotes específicos, foram utilizadas abstrações para pacotes como **Dio** (para requisições HTTP) e **GetStorage** (para armazenamento local). Isso garante que a aplicação mantenha a flexibilidade e possa ser facilmente adaptada ou substituída por outras implementações sem a necessidade de grandes alterações no código base.

</details>
</details>

## Em Uso | Imagens e Video

<details>
<summary>Clique para Expandir!</summary>

//

</details>


## Redes Sociais

<details>
<summary>Clique para Expandir!</summary>

Redes Sociais abaixo:

- [LinkedIn](https://www.linkedin.com/in/iagoaferreira/)

</details>
