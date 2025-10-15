#!/bin/bash
echo "🚀 Configuration Copilouffle Assistant Ollama"

# Vérifier Ollama
if ! command -v ollama &> /dev/null; then
    echo "❌ Ollama non installé. Installation..."
    curl -fsSL https://ollama.ai/install.sh | sh
fi

# Créer les modèles Copilouffle
echo "🏠 Création des modèles Copilouffle..."

# Modèle principal code
ollama create copilouffle-code -f Copilouffle-Modelfile-code

# Modèle DevOps
ollama create copilouffle-devops -f modelfiles/Copilouffle-Modelfile-devops

echo "✅ Modèles Copilouffle créés!"
echo ""
echo "🎯 Utilisation :"
echo "   ollama run copilouffle-code 'Aide-moi avec ce code Python'"
echo "   ollama run copilouffle-devops 'Comment dockeriser mon app?'"
