import ollama
import gradio as gr

def query_copilouffle(question, model_choice="copilouffle-code"):
    """Interroge le modèle Copilouffle"""
    try:
        response = ollama.chat(
            model=model_choice,
            messages=[{'role': 'user', 'content': question}]
        )
        return response['message']['content']
    except Exception as e:
        return f"❌ Erreur: {str(e)}\nVérifie que le modèle est créé: ollama list"

# Interface simple et efficace
with gr.Blocks(title="🏠 Assistant Copilouffle") as interface:
    gr.Markdown("# 🏠 Copilouffle Assistant Technique")
    gr.Markdown("**Assistant spécialisé pour les défis du workshop M2**")
    
    with gr.Row():
        model_choice = gr.Dropdown(
            choices=["copilouffle-code", "copilouffle-devops"],
            value="copilouffle-code",
            label="Modèle spécialisé"
        )
    
    with gr.Row():
        question = gr.Textbox(
            lines=3,
            placeholder="Pose ta question technique...\nEx: Comment créer une API REST avec Flask?",
            label="Question"
        )
    
    with gr.Row():
        ask_btn = gr.Button("🚀 Demander à Copilouffle")
    
    with gr.Row():
        response = gr.Textbox(
            lines=6,
            label="Réponse de Copilouffle",
            interactive=False
        )
    
    ask_btn.click(
        fn=query_copilouffle,
        inputs=[question, model_choice],
        outputs=response
    )

if __name__ == "__main__":
    interface.launch(server_port=7860, share=False)
