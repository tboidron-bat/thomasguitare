#!/bin/bash

set -e

echo "🚀 Mise à jour du site..."

# Vérifie que tu es dans un dépôt Git
if [ ! -d .git ]; then
    echo "❌ Ce dossier n'est pas un dépôt Git."
    exit 1
fi

# Vérifie la branche courante
BRANCHE=$(git branch --show-current)

if [ "$BRANCHE" != "master" ]; then
    echo "❌ Tu dois être sur la branche master."
    echo "Branche actuelle : $BRANCHE"
    exit 1
fi

# Ajoute les modifications
git add .

# Vérifie s'il y a des changements à valider
if ! git diff --cached --quiet; then

    # Commit avec message personnalisé ou automatique
    if [ -z "$1" ]; then
        git commit -m "Mise à jour automatique"
    else
        git commit -m "$1"
    fi

else
    echo "ℹ️ Aucun changement à valider."
fi

# Récupère les changements distants
echo "🔄 Récupération des changements depuis GitHub..."

git fetch origin main

# Intègre les changements distants dans master
git rebase origin/main

# Envoie master vers main sur GitHub
echo "📤 Envoi des modifications vers GitHub..."

git push origin master:main

echo "✅ Site mis à jour avec succès !"