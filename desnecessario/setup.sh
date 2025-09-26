#!/bin/bash

# Script de configuração inicial do projeto Alfred
echo "🚀 Configurando o projeto Alfred - Sistema de Comandas"

# Verificar se o Docker está rodando
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker não está rodando. Por favor, inicie o Docker primeiro."
    exit 1
fi

# Criar arquivo .env se não existir
if [ ! -f .env ]; then
    echo "📝 Criando arquivo .env..."
    cp env.example .env
    echo "✅ Arquivo .env criado com sucesso!"
else
    echo "ℹ️  Arquivo .env já existe."
fi

# Construir e iniciar os containers
echo "🐳 Construindo e iniciando containers Docker..."
docker compose up -d --build

# Aguardar os containers estarem prontos
echo "⏳ Aguardando containers estarem prontos..."
sleep 15

# Verificar se o projeto Laravel foi inicializado
echo "🔍 Verificando inicialização do Laravel..."
if ! docker compose exec app test -f artisan; then
    echo "📦 Inicializando projeto Laravel..."
    docker compose exec app ./init-laravel.sh
fi

# Executar migrações se o banco estiver pronto
echo "🗄️  Executando migrações do banco de dados..."
docker compose exec app php artisan migrate --force || echo "⚠️  Migrações serão executadas quando o banco estiver pronto"

# Executar seeders se existirem
echo "🌱 Verificando seeders..."
docker compose exec app php artisan db:seed || echo "ℹ️  Nenhum seeder encontrado"

echo "✅ Configuração concluída!"
echo ""
echo "🌐 Acesse a aplicação em:"
echo "   - API: http://localhost:8000"
echo "   - Nginx: http://localhost"
echo ""
echo "📊 Para ver os logs:"
echo "   docker-compose logs -f"
echo ""
echo "🛠️  Para parar os containers:"
echo "   docker-compose down"
