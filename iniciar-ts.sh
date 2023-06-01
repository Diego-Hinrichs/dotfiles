#!/usr/bin/zsh

if [ -z "$1" ]; then
	echo "Se ejecuta como: inits <nombre_directorio>"
	exit 1
fi

# Directorio actual o raiz
PROJECT_DIR=$(pwd)
cd "$PROJECT_DIR"

# Moverse al directorio creado
mkdir "$1"
cd "$1"

# > /dev/null 2>&1, se utiliza para no mostrar la salida del comando en consola
# en caso de error si muestra la salida

git init > /dev/null 2>&1
npm install -g typescript > /dev/null 2>&1 
npm init -y > /dev/null 2>&1 # package.json
tsc --init > /dev/null 2>&1 # tsconfig.json
npm i > /dev/null 2>&1 # Instalar dependencias

echo "node_modules\n.env" >> .gitignore
echo "$1" >> README.md
touch .env app.ts
mkdir src
mv app.ts ./src/app.ts
