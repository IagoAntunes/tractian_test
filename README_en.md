# TRACTIAN Test

:iphone::large_blue_circle: Mobile Software Engineer test

Assets are essential for the functioning of the industry and can include everything from manufacturing equipment to transport vehicles and power generation systems. Proper management and maintenance are crucial to ensure they continue to operate efficiently and effectively. A practical way to visualize the hierarchy of assets is through a tree structure.

- View the application below: [Imagens e Vídeo](#em-uso--imagens-e-video)
- Architecture: [Arquitetura](#arquitetura)
- Technologies and Tools: [Tecnologias e Ferramentas](#tecnologias-e-ferramentas)

- Video:

https://github.com/IagoAntunes/tractian_test/assets/63758301/d7598d91-8600-4cda-b2d3-12dc5583835a

### Challenge

📌 **Build a Tree View Application that shows companies Assets.**

The tree is basically composed of components, assets, and locations.

## Introdução

<details>
<summary>Click to Expand!</summary>

Welcome to the Tree View Application project! This project was developed as part of a technical challenge to build an application that displays companies' assets in a hierarchical tree structure. Visualizing assets in a tree format facilitates understanding the relationship between locations, assets, and components, enabling more efficient and effective management of industrial resources.
In this application, you will be able to:

- Visualize the hierarchy of assets in a tree structure.
- Filter assets based on different criteria such as status, text, qrCode.
- Store and retrieve asset data locally to support offline functionality.
- View the status of assets of a unit.

Below, you will find the instructions for installation, use, and details for this project.

</details>

## Installation

<details>
<summary>Click to Expand!</summary>

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

## Technologies and Tools

<details>
<summary>Click to Expand!</summary>

### Tecnologias 
- Flutter

### Ferramentas
- [GetX](https://pub.dev/packages/get) - Used for state management, navigation, and dependency injection.
- [dio](https://pub.dev/packages/dio) - Package used for making HTTP requests (not used as the data is mocked).
- [get_storage](https://pub.dev/packages/get_storage) - Package used for data storage, allowing offline functionality of the application.
- [internet_connection_checker](https://pub.dev/packages/internet_connection_checker) - Used to check if the user has an internet connection.
- [qr_code_scanner](https://pub.dev/packages/qr_code_scanner) - Used to read data from a QR code and filter assets.
- [path_provider](https://pub.dev/packages/path_provider) - Used to access mock data in the assets folder, making runtime queries dynamic without fixed data.

</details>

## Unit Tests

<details>
<summary>Click to Expand!</summary>

```Coverage is a metric that indicates how many lines of code, instructions, conditions, or paths of the program are tested by the set of unit tests.```

**Coverage:** 81,2%

Unit tests are used to test individual units of code. In Flutter, unit tests are written using the flutter_test library, with the help of other libraries like [**mocktail**](https://pub.dev/packages/mocktail)

To run the unit tests, follow these steps:

```dart
flutter test
```

</details>

## Architecture

<details>
<summary>Clique para Expandir!</summary>
  
This project uses Clean Architecture to organize the code in a modular and decoupled manner, facilitating system maintenance and evolution. The folder structure is organized as follows:

### Folder Structure

```
lib
│
├── core
│
├── features
|
├── settings

```

- **core:** Contains code and rules that are shared between the application's functionalities.
- **features** Contains the code for each functionality.
- **settings** Contains theme settings such as color styles, texts, and dependency injection.

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
- **domain:** Contains repository abstractions and models (entities) that represent the application's fundamental data.
  - `entities:` Models that represent data.
  - `repositories:` Repository interfaces.

- **external:** Responsible for implementing external data sources and data access objects (DAO).
  - `datasources:` Implementation of external data sources, such as APIs.
  - `dao:` Data access objects for local storage.

- **infra:** Contains the implementation of repositories and abstractions of data sources.
  - `repositories:` Implementation of repository interfaces defined in the domain.
  - `datasources:` Interfaces of external data sources.

- **presentation:** Contains code related to the user interface (UI) and controllers.
  - `controllers:` Controllers managing the presentation logic.
  - `pages:` Application pages.
  - `widgets:` Reusable UI components.

### Package Abstraction

To avoid code coupling to specific packages, abstractions were used for packages like Dio (for HTTP requests) and GetStorage (for local storage). This ensures the application maintains flexibility and can be easily adapted or replaced by other implementations without major changes to the codebase.

</details>
</details>

## In Use | Images and Video

<details>
<summary>Click to Expand!</summary>

[<img  height="600px" width="285px" alt="Warpnet"  src="https://github.com/IagoAntunes/tractian_test/blob/main/assets/github/home_page.png"/>](HomePage)
[<img  height="600px" width="285px" alt="Warpnet"  src="https://github.com/IagoAntunes/tractian_test/blob/main/assets/github/assets_page.png"/>](AssetsPage)
[<img  height="600px" width="285px" alt="Warpnet"  src="https://github.com/IagoAntunes/tractian_test/blob/main/assets/github/assets_page_filter_energy.png"/>](AssetsPageFilterEnergy)
[<img  height="600px" width="285px" alt="Warpnet"  src="https://github.com/IagoAntunes/tractian_test/blob/main/assets/github/assets_page_filter_alert.png"/>](AssetsPageFilterAlert)
[<img  height="600px" width="285px" alt="Warpnet"  src="https://github.com/IagoAntunes/tractian_test/blob/main/assets/github/assets_page_filter_text.png"/>](AssetsPageFilterAlert)
[<img  height="600px" width="285px" alt="Warpnet"  src="https://github.com/IagoAntunes/tractian_test/blob/main/assets/github/assets_page_filter_qr.png"/>](AssetsPageFilterQr)

<details>
<summary>Pages in English!</summary>
    
[<img  height="600px" width="285px" alt="Warpnet"  src="https://github.com/IagoAntunes/tractian_test/blob/main/assets/github/home_page_english.png"/>](HomePageEnglish)
[<img  height="600px" width="285px" alt="Warpnet"  src="https://github.com/IagoAntunes/tractian_test/blob/main/assets/github/assets_page_english.png"/>](AssetsPage)
    
</details>

</details>


## Social Media

<details>
<summary>Click to Expand!</summary>

Social Media links below:

- [LinkedIn](https://www.linkedin.com/in/iagoaferreira/)

</details>
