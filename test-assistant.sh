#!/bin/bash

echo "🧪 Test de l'Assistant Copilouffle 🏰"
echo "====================================="

echo "1. Test de présentation :"
ollama run copilouffle-llama3.2 "Présente-toi en 2 phrases"

echo ""
echo "2. Test technique :"
ollama run copilouffle-llama3.2 "Donne un conseil pour un projet Docker"

echo ""
echo "3. Test valeurs maison :"
ollama run copilouffle-llama3.2 "Comment la persévérance aide-t-elle en informatique ?"

echo ""
echo "✅ Tests terminés !"
