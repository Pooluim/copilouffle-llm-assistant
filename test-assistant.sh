#!/bin/bash

echo "🧪 Test de l'Assistant Copilouffle"

# Vérifier que Ollama tourne
if ! pgrep -x "ollama" > /dev/null; then
    echo "🔧 Démarrage d'Ollama..."
    ollama serve > /dev/null 2>&1 &
    sleep 3
fi

# Tester le modèle
echo "🤖 Test du modèle copilouffle-code..."
ollama run copilouffle-code "Présente-toi en 2 phrases et explique ton rôle pour le workshop M2"

echo ""
echo "📋 Test des modèles disponibles..."
ollama list

echo ""
echo "✅ Test terminé!"
echo "👉 Pour l'interface web: python app.py"
echo "👉 Pour chat direct: ollama run copilouffle-code"
