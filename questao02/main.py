# Definição da classe Token
class Token:
    def __init__(self, lexeme, tipo, valor):
        """
        Representa um token gerado na análise léxica.
        :param lexeme: A string original do token encontrado no código-fonte (ex: "5", "+").
        :param tipo: O tipo do token, como "NÚMERO" para números ou "OPERADOR" para operadores matemáticos.
        :param valor: O valor interpretado do token (por exemplo, para o token '+', o valor pode ser "SOMA").
        """
        self.lexeme = lexeme
        self.tipo = tipo
        self.valor = valor

    def __repr__(self):
        """
        Representação textual do token para facilitar a depuração.
        """
        return f"TOKEN: {self.lexeme}\tTIPO: {self.tipo}\t\tVALOR: {self.valor}"


# Analisador Léxico (Lexer)
class Lexer:
    def __init__(self, texto):
        """
        Responsável por converter um texto de entrada em uma lista de tokens.
        :param texto: A string contendo a expressão matemática que será processada.
        """
        self.texto = texto
        self.pos = 0  # Posição atual no texto
        self.tokens = []  # Lista para armazenar os tokens gerados

    def tokenize(self):
        """
        Lê o texto caractere por caractere e gera tokens correspondentes.
        """
        while self.pos < len(self.texto):
            char = self.texto[self.pos]

            # Ignorar espaços em branco
            if char.isspace():
                self.pos += 1
                continue

            # Identificar números inteiros (pode ter vários dígitos)
            if char.isdigit():
                num_str = ''
                while self.pos < len(self.texto) and self.texto[self.pos].isdigit():
                    num_str += self.texto[self.pos]
                    self.pos += 1
                self.tokens.append(Token(num_str, "NÚMERO", num_str))
                continue

            # Identificar operadores matemáticos
            if char in '+-*/':
                op_map = {'+': "SOMA", '-': "SUBTRAÇÃO", '*': "MULTIPLICAÇÃO", '/': "DIVISÃO"}
                self.tokens.append(Token(char, "OPERADOR", op_map[char]))
                self.pos += 1
                continue

            # Identificar parênteses
            if char == '(':
                self.tokens.append(Token(char, "PARÊNTESE ABERTO", char))
                self.pos += 1
                continue
            if char == ')':
                self.tokens.append(Token(char, "PARÊNTESE FECHADO", char))
                self.pos += 1
                continue

            # Se um caractere desconhecido for encontrado, lançar erro
            raise Exception(f"Caractere desconhecido: {char}")
        
        return self.tokens


# Nós da Árvore de Sintaxe Abstrata (AST)
class NumberNode:
    def __init__(self, token):
        """
        Nó da AST que representa um número.
        """
        self.token = token
        self.value = int(token.valor)  # Converte o valor do token para inteiro

    def __repr__(self):
        return f"Number({self.value})"


class BinOpNode:
    def __init__(self, left, op_token, right):
        """
        Nó da AST que representa uma operação binária.
        :param left: Nó esquerdo da operação.
        :param op_token: Token do operador (+, -, *, /).
        :param right: Nó direito da operação.
        """
        self.left = left
        self.op_token = op_token
        self.right = right

    def __repr__(self):
        return f"BinOp({self.left}, {self.op_token.lexeme}, {self.right})"


# Analisador Sintático (Parser)
class Parser:
    def __init__(self, tokens):
        """
        Constrói a árvore sintática abstrata (AST) a partir dos tokens gerados pelo Lexer.
        """
        self.tokens = tokens
        self.pos = 0  # Posição atual na lista de tokens

    def current_token(self):
        """
        Retorna o token atual sem avançar na lista.
        """
        if self.pos < len(self.tokens):
            return self.tokens[self.pos]
        return None

    def eat(self, tipo_esperado=None):
        """
        Consome o token atual se for do tipo esperado e avança para o próximo.
        """
        token = self.current_token()
        if token is None:
            raise Exception("Fim dos tokens inesperado!")
        if tipo_esperado and token.tipo != tipo_esperado:
            raise Exception(f"Token inesperado: {token}")
        self.pos += 1
        return token

    def expr(self):
        """
        Regra da gramática:
        expr -> term (('+' | '-') term)*
        """
        node = self.term()
        while self.current_token() and self.current_token().lexeme in ('+', '-'):
            op_token = self.eat()
            right = self.term()
            node = BinOpNode(node, op_token, right)
        return node

    def term(self):
        """
        Regra da gramática:
        term -> factor (('*' | '/') factor)*
        """
        node = self.factor()
        while self.current_token() and self.current_token().lexeme in ('*', '/'):
            op_token = self.eat()
            right = self.factor()
            node = BinOpNode(node, op_token, right)
        return node

    def factor(self):
        """
        Regra da gramática:
        factor -> NÚMERO | '(' expr ')'
        """
        token = self.current_token()
        if token.tipo == "NÚMERO":
            self.eat("NÚMERO")
            return NumberNode(token)
        elif token.lexeme == '(':
            self.eat("PARÊNTESE ABERTO")
            node = self.expr()
            self.eat("PARÊNTESE FECHADO")
            return node
        else:
            raise Exception("Erro de sintaxe: token inesperado!")


# Gerador de Código para uma máquina de pilha
class CodeGenerator:
    def __init__(self):
        self.instructions = []  # Lista de instruções geradas

    def generate(self, node):
        """
        Percorre a AST e gera código baseado em operações de pilha.
        """
        if isinstance(node, NumberNode):
            self.instructions.append(f"PUSH {node.value}")
        elif isinstance(node, BinOpNode):
            self.generate(node.left)
            self.generate(node.right)
            op_map = {'+': "ADD", '-': "SUB", '*': "MUL", '/': "DIV"}
            self.instructions.append(op_map[node.op_token.lexeme])
        else:
            raise Exception("Nodo desconhecido!")
        return self.instructions
# Função principal
def main():
    nome_arquivo = "entrada.txt"
    with open(nome_arquivo, "r") as file:
        conteudo = file.read().strip()

    print("Expressão de entrada:")
    print(conteudo)
    print("\n--- Análise Léxica ---")

    lexer = Lexer(conteudo)
    tokens = lexer.tokenize()
    for token in tokens:
        print(token)

    print("\n--- Análise Sintática (AST) ---")
    parser = Parser(tokens)
    ast = parser.expr()
    print(ast)

    print("\n--- Geração de Código ---")
    codegen = CodeGenerator()
    instrucoes = codegen.generate(ast)
    for instr in instrucoes:
        print(instr)

if __name__ == "__main__":
    main()