#!/bin/bash

# Nom du repo GitHub (le tien)
REPO="thomasguitare"
USERNAME="tboidron-bat"
BRANCH="main"

# Message de commit
COMMIT_MSG=${1:-"🚀 Déploiement du site"}

echo "🔍 Vérification du dépôt Git..."

if [ ! -d .git ]; then
  echo "❌ Ce dossier n'est pas un dépôt Git."
  exit 1
fi

echo "📦 Ajout des fichiers..."
git add .

echo "📝 Commit..."
git commit -m "$COMMIT_MSG"

echo "🔄 Pull pour rebase..."
git pull origin $BRANCH --rebase

echo "📤 Push vers GitHub..."
git push origin $BRANCH

echo "🌐 Vérifie que GitHub Pages est activé..."
echo "👉 Va sur : https://github.com/$USERNAME/$REPO/settings/pages"

echo ""
echo "✅ Ton site sera accessible à cette adresse :"
echo "   👉 https://$USERNAME.github.io/$REPO/"
