#!/bin/bash

echo "🚀 Mise à jour du site..."

# Vérifie que tu es dans un dépôt git
if [ ! -d .git ]; then
  echo "❌ Ce dossier n'est pas un dépôt Git."
  exit 1
fi

# Vérifie s'il y a des changements
if git diff-index --quiet HEAD --; then
  echo "ℹ️ Aucun changement à valider."
else
  # Ajout des fichiers modifiés
  git add .

  # Commit avec message automatique
  if [ -z "$1" ]; then
    git commit -m "Mise à jour automatique"
  else
    git commit -m "$1"
  fi
fi

# Récupération des changements distants (en rebase)
git pull origin main --rebase || {
  echo "❌ Conflit ou index sale, pull annulé."
  exit 1
}

# Push vers GitHub
git push origin main

echo "✅ Site mis à jour avec succès !"
