OPERADORES = {'+': 'SOMA', '-': 'SUB', '*': 'MULT', '/': 'DIV'}
PARENTES = {'(': 'PARESQ', ')': 'PARDIR'}

# Função para verificar se é um operador
def eh_operador(c):
    return c in OPERADORES

# Função para verificar se é um parêntese
def eh_parentese(c):
    return c in PARENTES

# Função principal para análise léxica
def analisar_expressao(expressao):
    pos = 0
    tamanho = len(expressao)

    print("\n===== Analise =====")
    while pos < tamanho:
        c = expressao[pos]

        # Ignorar espaços em branco
        if c.isspace():
            pos += 1
            continue

        # Verificar se é um número
        if c.isdigit():
            numero = c
            pos += 1
            while pos < tamanho and expressao[pos].isdigit():
                numero += expressao[pos]
                pos += 1
            print(f"Tipo: Numero     -- Valor: {numero}")
            continue

        # Verificar se é um operador
        if eh_operador(c):
            print(f"Tipo: Operador   -- Valor: {OPERADORES[c]}")
            pos += 1
            continue

        # Verificar se é um parêntese
        if eh_parentese(c):
            print(f"Tipo: Pontuacao -- Valor: {PARENTES[c]}")
            pos += 1
            continue

        # Caso de caractere desconhecido
        print(f"Caractere desconhecido: {c}")
        pos += 1

# Função principal
def main():
    print("Analise Lexica para Expressoes")
    entrada = input("Expressao: ")
    analisar_expressao(entrada)

if __name__ == "__main__":
    main()
