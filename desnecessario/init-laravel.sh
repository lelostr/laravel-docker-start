#!/bin/bash

# Script para inicializar o projeto Laravel dentro do container

echo "🚀 Inicializando projeto Laravel..."

# Verificar se já existe um projeto Laravel
if [ ! -f artisan ]; then
    echo "📦 Criando novo projeto Laravel..."
    
    # Criar projeto Laravel
    composer create-project laravel/laravel . --prefer-dist --no-interaction
    
    # Copiar nosso composer.json personalizado
    if [ -f composer.json.backup ]; then
        cp composer.json.backup composer.json
        composer update --no-dev --optimize-autoloader
    fi
    
    echo "✅ Projeto Laravel criado com sucesso!"
else
    echo "ℹ️  Projeto Laravel já existe."
fi

# Gerar chave da aplicação se não existir
if [ -z "$APP_KEY" ] || [ "$APP_KEY" = "" ]; then
    echo "🔑 Gerando chave da aplicação..."
    php artisan key:generate
fi

# Executar migrações se o banco estiver disponível
echo "🗄️  Verificando banco de dados..."
if php artisan migrate:status > /dev/null 2>&1; then
    echo "📊 Executando migrações..."
    php artisan migrate --force
else
    echo "⚠️  Banco de dados não disponível ainda. Migrações serão executadas quando o banco estiver pronto."
fi

# Configurar permissões
echo "🔐 Configurando permissões..."
chown -R www-data:www-data /var/www/html/storage
chown -R www-data:www-data /var/www/html/bootstrap/cache
chmod -R 755 /var/www/html/storage
chmod -R 755 /var/www/html/bootstrap/cache

echo "✅ Inicialização concluída!"
