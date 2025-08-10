#!/bin/bash

echo "🚀 Mise à jour du site..."

# Vérifie que tu es dans un dépôt git
if [ ! -d .git ]; then
  echo "❌ Ce dossier n'est pas un dépôt Git."
  exit 1
fi

# Ajout des fichiers modifiés
git add .

# Commit avec message automatique
git commit -m "$1

# Récupération des changements distants (en rebase)
git pull origin main --rebase

# Push vers GitHub
git push origin main

echo "✅ Site mis à jour avec succès !"
