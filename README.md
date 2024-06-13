## Desenvolvimento

### Ambiente

O projeto está preparado para montar todo o ambiente no VS Code via containers, facilitado pela extensão [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

- Instale o WSL (se estiver no Windows)
- Instale Docker Desktop
- No VS Code instale a extensão e abra o projeto usando a opção "Dev Containers: Open Folder in Container".

### Testes
Para rodar os testes:
```sh
rails test:all
```
