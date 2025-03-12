# Danilo C. de Sousa

import ply.lex as lex
import gradio as gr

# Definição dos tokens
tokens = (
    'NUMERO',
    'VARIAVEL',
    'OPERADOR',
    'IGUALDADE'
)

# Expressões regulares para os tokens
def t_NUMERO(t):
    r'\d+'
    t.value = int(t.value)
    return t

def t_VARIAVEL(t):
    r'[a-zA-Z]'
    return t

def t_IGUALDADE(t):
    r'='
    return t

def t_OPERADOR(t):
    r'[+\-*/]'
    return t

t_ignore = ' \t'

def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)

def t_error(t):
    print(f"Erro Léxico: Caractere inválido {t.value[0]}")
    t.lexer.skip(1)

lexer = lex.lex()

# Função para analisar a equação
def analisar_lexicamente(entrada):
    lexer.input(entrada)
    resultado = "TOKEN | TIPO | VALOR\n"
    resultado += "-" * 30 + "\n"
    
    operadores = {'+': 'SOMA', '-': 'SUBTRAÇÃO', '*': 'MULTIPLICAÇÃO', '/': 'DIVISÃO'}
    
    for token in lexer:
        if token.type == 'NUMERO':
            tipo = "NÚMERO"
            valor = str(token.value)
        elif token.type == 'VARIAVEL':
            tipo = "VARIÁVEL"
            valor = token.value
        elif token.type == 'OPERADOR':
            tipo = "OPERADOR"
            valor = operadores[token.value]
        elif token.type == 'IGUALDADE':
            tipo = "IGUALDADE"
            valor = "IGUALDADE"
        resultado += f"{token.value} | {tipo} | {valor}\n"
    
    return resultado

# Criando a interface gráfica com Gradio
iface = gr.Interface(
    fn=analisar_lexicamente,
    inputs=gr.Textbox(label="Digite a equação do 1º grau:"),
    outputs=gr.Textbox(label="Resultado da análise léxica"),
    title="Analisador Léxico",
    description="Digite uma equação do 1º grau para analisar os tokens."
)

iface.launch()
