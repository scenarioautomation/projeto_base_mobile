# Processo Seletivo - Mobile
Este repositório oferece um projeto base para candidatos implementarem a proposta do **Processo Seletivo Scenario** para o time **Mobile**
## Sobre
O projeto contém uma tela principal com título "Casas" e um botão➕.
<img src="https://drive.google.com/uc?export=view&id=1LTUdJYO-oz2Brv4uxFo-x9oCECKtf9Ix" alt="Imagem representando a descrição anterior" width="180" height="350">


Ao clicar no ➕, uma tela para adicionar a casa é aberta, na qual o usuário precisa inserir o nome e a foto da Casa.
<img src="https://drive.google.com/uc?export=view&id=1I41lze0r5bjpotCVy7jRjwUFYEd-4Ghz" alt="Imagem representando a descrição anterior" width="180" height="350">

Ao clicar no botão "Criar", os dados da casa são salvos e ela é exibida na lista de casas.
<img src="https://drive.google.com/uc?export=view&id=1XhRfAIo0Xep4mXmcMBojmRlOPIy0r2eL" alt="Imagem representando a descrição anterior" width="60" height="30">

## Arquivos
- Na raiz há um arquivo 📂 **main.dart** que configura e inicia a aplicação.

O código está dividido em três pastas principais:

🗂 data

↳📂 file_controller.dart:
: Classe para controle de dados locais, realizando leitura e escrita de arquivos.

---
🗂 general

↳📂 image_picker_controller.dart
: Classe para selecionar e cortar imagem da galeria.

↳📂 scenario_colors.dart
: Classe estática para reunir as cores usadas no projeto.

---
🗂 home / 🗂 data

↳📂 home_list_parser.dart
: Classe que conecta HomeViewModel e FileController, permitindo a tradução entre o modelo HomeModel e String.

---
🗂 home / 🗂 model

↳📂 home_model.dart
: Classe que representa uma casa na tela. Anotada com `@JsonSerializable` para facilitar a codificação e decodificação dos dados salvos em arquivo.


↳📂 home_model_list.dart
: Classe que representa uma lista de casas na tela. Anotada com `@JsonSerializable` para facilitar a codificação e decodificação dos dados salvos em arquivo.

---
🗂 home / 🗂 view
 
↳📂 home_add_page.dart
: Classe que representa o visual da tela "Adicionar casa"

↳📂 home_list_item.dart
: Classe que representa o visual do item na lista de casas

↳📂 home_list_page.dart
: Classe que representa o visual da tela "Lista de casas"

 ---
🗂 home / 🗂 view / 🗂 widgets
  
↳📂 picture_field_widget.dart
: Classe que representa a visualização da imagem selecionada juntamente com o botão de selecionar imagem

↳📂 select_picture_widget.dart
: Classe que representa o visual do botão de selecionar imagem

  ---
🗂 home / 🗂 viewmodel
 
↳📂   home_view_model.dart
: Classe que representa o controlador de ações na tela, além de buscar ou enviar dados para o HomeListParser


  ---

### 📌 Detalhes
> **Versão do Flutter**: 3.13.4
> **Versão do Dart**: 3.1.2
> **JDK**: Amazon Corretto version 17.0.7
> **Linguagem**: Kotlin e IOS
