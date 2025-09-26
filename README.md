# passo a passo para criar uma nova aplicacao laravel, totalmente via docker

1. criar a pasta vazia

> subistitua para sua necessidade

```bash
mkdir new_folder && cd new_folder
```

2. criar o projeto laravel, utilizando 

```bash
# cria o projeto laravel na pasta local
docker run --rm -v $(pwd):/app -w /app composer create-project laravel/laravel . --prefer-dist --no-interaction
```

> **Importante:** Os arquivos são criados como usuário root!

> Importante versionar esta primeira criacao

3. criar os arquivos Dockerfile e compose na raiz do projeto

4. criar a pasta docker, que conterá os arquivos de configuração do projeto para rodar em docker

5. renomear o projeto dentro do arquivo compose

6. configurar o arquivo `.env`

> O arquivo .env sera criado pelo laravel.  
> Somente precisa definir as variaveis de conexao, de acordo com o arquivo env deste conteudo

7. configurar o arquivo init.sql, se necessário