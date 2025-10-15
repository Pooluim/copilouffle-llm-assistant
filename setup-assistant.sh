#!/bin/bash

echo "🚀 Configuration de l'Assistant Copilouffle"

# Vérifier Ollama
if ! command -v ollama &> /dev/null; then
    echo "📥 Installation d'Ollama..."
    curl -fsSL https://ollama.ai/install.sh | sh
fi

# Démarrer Ollama
echo "🔧 Démarrage du service Ollama..."
ollama serve > /dev/null 2>&1 &
sleep 5

# Vérifier si CodeLlama est disponible
if ! ollama list | grep -q "codellama:7b"; then
    echo "📥 Téléchargement de CodeLlama:7b..."
    ollama pull codellama:7b
fi

# Créer le modèle Copilouffle
echo "🏠 Création du modèle Copilouffle..."
if [ -f "Copilouffle-Modelfile-code" ]; then
    ollama create copilouffle-code -f Copilouffle-Modelfile-code
    echo "✅ Modèle copilouffle-code créé!"
else
    echo "❌ Fichier Copilouffle-Modelfile-code non trouvé!"
    exit 1
fi

# Créer environnement Python
echo "🐍 Configuration de l'environnement Python..."
python3 -m venv venv
source venv/bin/activate

# Installer dépendances
pip install --upgrade pip
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
else
    pip install ollama gradio requests
fi

echo ""
echo "🎯 INSTALLATION TERMINÉE !"
echo "👉 Pour tester: ./test-assistant.sh"
echo "👉 Pour lancer l'interface: python app.py"
echo "👉 Modèles disponibles: ollama list"
