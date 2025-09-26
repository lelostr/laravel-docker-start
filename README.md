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

3. criar os arquivos Dockerfile e compose na raiz do projeto

4. criar a pasta docker, que conterá os arquivos de configuração do projeto para rodar em docker

5. criar o arquivo `.env`