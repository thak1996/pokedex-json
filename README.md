# Integração

Pokedex com integração de arquivo json.

## Descrição

Projeto criado com simulação de integração API, utilizando diversas ferramentas para tratamento de dados.

## Pacotes Utilizados

-   **provider**: Para gerenciamento de estado.
-   **http**: Para fazer requisições HTTP.
-   **cached_network_image**: Para carregar imagens de forma eficiente.
-   **flutter_modular**: Para gerenciamento de rotas e dependências.

## Construção do Estado das Telas

Este projeto utiliza o padrão **ChangeNotifier** do pacote `provider` para gerenciar o estado das telas. As classes de controle (controllers) são responsáveis por atualizar o estado e notificar os widgets que dependem desse estado.

### Exemplo de Uso

```
dart
class MyController extends ChangeNotifier {
    String data;
    String get data => data;
    void fetchData() {
        // Lógica para buscar dados
        data = "Dados carregados";
        notifyListeners();
    }
}
```

## Demonstração

<div style="display: flex; justify-content: space-around; flex-wrap: wrap;">
    <img src="/assets/readme/home.jpg" alt="Home" style="width: 250px; height: auto; margin: 10px;">
    <img src="/assets/readme/details.jpg" alt="Details" style="width: 250px; height: auto; margin: 10px;">
    <img src="/assets/readme/not_found.jpg" alt="Not Found" style="width: 250px; height: auto; margin: 10px;">
    <img src="/assets/readme/sort_name.jpg" alt="Sort by Name" style="width: 250px; height: auto; margin: 10px;">
    <img src="/assets/readme/sort_number.jpg" alt="Sort by Number" style="width: 250px; height: auto; margin: 10px;">
</div>

## Instalação

Para começar a usar este projeto, siga os passos abaixo:

1. Clone o repositório:
    ```bash
    git clone git@github.com:thak1996/integration.git
    ```
2. Navegue até o diretório do projeto:
    ```bash
    cd integration
    ```
3. Instale as dependências:
    ```bash
    flutter pub get
    ```
4. Execute o aplicativo:
    ```bash
    flutter run
    ```

## Autor

**Franklyn Viana dos Santos** - [Seu GitHub](https://github.com/thak1996)

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um pull request.
