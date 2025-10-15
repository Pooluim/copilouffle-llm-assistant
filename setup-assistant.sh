#!/bin/bash

echo "🏰 Installation de l'Assistant Copilouffle..."
echo "=============================================="

# Vérifier si Ollama est installé
if ! command -v ollama &> /dev/null; then
    echo "❌ Ollama n'est pas installé. Veuillez l'installer depuis https://ollama.com"
    exit 1
fi

echo "✅ Ollama détecté"

# Télécharger le modèle de base
echo "📥 Téléchargement de Llama 3.2 3B..."
ollama pull llama3.2:3b

# Créer le modèle personnalisé
echo "🔧 Création de l'assistant Copilouffle..."
ollama create copilouffle-llama3.2 -f Copilouffle-Modelfile

echo ""
echo "✅ Installation terminée avec succès !"
echo "🎯 Testez avec : ollama run copilouffle-llama3.2 'Bonjour Copilouffle !'"
