# Makefile para o projeto Alfred
# Comandos úteis para desenvolvimento

.PHONY: help install start stop restart logs shell test clean build

# Comando padrão
help:
	@echo "🚀 Comandos disponíveis para o projeto Alfred:"
	@echo ""
	@echo "📦 Instalação e Configuração:"
	@echo "  make install    - Instalar e configurar o projeto"
	@echo "  make start      - Iniciar containers"
	@echo "  make stop       - Parar containers"
	@echo "  make restart    - Reiniciar containers"
	@echo ""
	@echo "🔧 Desenvolvimento:"
	@echo "  make shell      - Acessar container da aplicação"
	@echo "  make logs       - Ver logs dos containers"
	@echo "  make test       - Executar testes"
	@echo ""
	@echo "🧹 Limpeza:"
	@echo "  make clean      - Limpar containers e volumes"
	@echo "  make build      - Reconstruir containers"

# Instalação e configuração
install:
	@echo "🚀 Instalando e configurando o projeto Alfred..."
	@./setup.sh

# Iniciar containers
start:
	@echo "🐳 Iniciando containers..."
	@docker compose up -d

# Parar containers
stop:
	@echo "🛑 Parando containers..."
	@docker compose down

# Reiniciar containers
restart: stop start
	@echo "🔄 Containers reiniciados!"

# Ver logs
logs:
	@echo "📋 Exibindo logs dos containers..."
	@docker compose logs -f

# Acessar shell do container
shell:
	@echo "🐚 Acessando shell do container da aplicação..."
	@docker compose exec app bash

# Executar testes
test:
	@echo "🧪 Executando testes..."
	@docker compose exec app php artisan test

# Limpar containers e volumes
clean:
	@echo "🧹 Limpando containers e volumes..."
	@docker compose down -v --remove-orphans
	@docker system prune -f

# Reconstruir containers
build:
	@echo "🔨 Reconstruindo containers..."
	@docker compose up -d --build

# Comandos Laravel específicos
migrate:
	@echo "🗄️  Executando migrações..."
	@docker compose exec app php artisan migrate

seed:
	@echo "🌱 Executando seeders..."
	@docker compose exec app php artisan db:seed

fresh:
	@echo "🔄 Recriando banco de dados..."
	@docker compose exec app php artisan migrate:fresh --seed

cache:
	@echo "💾 Limpando cache..."
	@docker compose exec app php artisan cache:clear
	@docker compose exec app php artisan config:clear
	@docker compose exec app php artisan route:clear
	@docker compose exec app php artisan view:clear

# Comandos de produção
prod:
	@echo "🚀 Iniciando em modo produção..."
	@docker compose -f docker-compose.prod.yml up -d --build

prod-stop:
	@echo "🛑 Parando modo produção..."
	@docker compose -f docker-compose.prod.yml down
