# MealApp Pos

Este é um aplicativo Flutter que consome informações da API [TheMealDB](https://www.themealdb.com/api.php). O principal objetivo deste projeto é implementar o padrão MVC (Model-View-Controller) e permitir que o usuário visualize receitas, veja detalhes de cada receita e tenha a funcionalidade de favoritar receitas. O estado dos favoritos é mantido em todas as telas do aplicativo.

## 📋 Funcionalidades

1. **Listagem de Receitas**: O usuário pode ver uma lista de receitas fornecidas pela API.
2. **Detalhes da Receita**: Ao clicar em uma receita, o usuário pode visualizar os detalhes da receita, como ingredientes e instruções.
3. **Favoritar Receitas**: O usuário pode favoritar/desfavoritar receitas diretamente da tela de detalhes.
4. **Tela de Favoritos**: Exibe todas as receitas que foram favoritedas pelo usuário.
5. **Navegação entre Telas**: O usuário pode navegar facilmente entre as telas de listagem de receitas, favoritos e categorias.
6. **Listagem por Categorias**: O usuário pode ver uma lista de categorias de receitas e, ao clicar em uma categoria, ver todas as receitas dessa categoria.

## 📱 Screenshots

- **Tela Inicial (Listagem de Receitas)**: Exibe a lista de receitas com nome e imagem.
- **Tela de Detalhes**: Exibe os detalhes completos de uma receita (nome, imagem, ingredientes e instruções).
- **Tela de Favoritos**: Exibe todas as receitas que foram adicionadas aos favoritos.
- **Tela de Categorias**: Lista as categorias disponíveis com suas respectivas receitas.
- **Tela de Receitas por Categoria**: Exibe receitas relacionadas a uma categoria selecionada.

## 🛠️ Tecnologias Utilizadas

- **Flutter**: SDK para desenvolvimento mobile.
- **Dart**: Linguagem de programação.
- **HTTP Package**: Para fazer as requisições à API TheMealDB.
- **Provider Package**: Para gerenciar o estado do aplicativo.

## 🚀 Como Rodar o Projeto

1. Clone este repositório em sua máquina local:
   ```bash
   git clone https://github.com/ManoLuuL/MealApp_Pos.git

2. Acesse o projeto em sua máquina local:
   ```bash
   cd MealApp_Pos

3. Atualize o projeto com os pacotes:
   ```bash
   flutter pub get

