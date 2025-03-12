; TESTE.ASM
	MOV	65400, R6		; Inicializa ponteiro da Pilha
	MOV	9, [65378]		; Efetuo atribuição
	SUB	10, R6			; Reserva espaço para variáveis globais
	JSR	PRINCIPAL		; Chama rotina principal
	HLT	 			; Encerra execução

PRINCIPAL:
	PUSH	R5			; Preservo o Base Pointer da função chamadora
	MOV	R6, R5  		; Copio endereço/pilha do Base Pointer (inicio-locais)
	PUSH	R0			; Salvo estado da máquina no momento da chamada
	PUSH	R1			; Salvo estado da máquina no momento da chamada
	PUSH	R2			; Salvo estado da máquina no momento da chamada
	PUSH	R3			; Salvo estado da máquina no momento da chamada
	PUSH	R4			; Salvo estado da máquina no momento da chamada

	JSR	#CLRSCR			; Apaga a tela (visor) do Cesar
	MOV	0, R0			; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	9, [R1]			; Efetuo atribuição 2
	MOV	1, R0			; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	7, [R1]			; Efetuo atribuição 2
	MOV	2, R0			; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	3, [R1]			; Efetuo atribuição 2
	MOV	3, R0			; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	8, [R1]			; Efetuo atribuição 2
	MOV	4, R0			; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	2, [R1]			; Efetuo atribuição 2
	MOV	5, R0			; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	5, [R1]			; Efetuo atribuição 2
	MOV	6, R0			; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	1, [R1]			; Efetuo atribuição 2
	MOV	7, R0			; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	4, [R1]			; Efetuo atribuição 2
	MOV	8, R0			; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	6, [R1]			; Efetuo atribuição 2
	MOV	9, R0			; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	0, [R1]			; Efetuo atribuição 2
	MOV	1, [65376]		; Efetuo atribuição
L1:
	NOP				; Inicio do Laço Para
	MOV	[65378], R0		; Movimento primeira expressão simples para R0
	CMP	[65376], R0		; Efetuo comparação de Inteiros
	BLE	L3			; Compara se menor ou igual
	PUSH	0			; Falso
	JMP	L4			;  
L3:
	PUSH	1			; Verdadeiro
L4:
	NOP	 			;  
	POP	R0			; Desempilho resultado da expressão
	CMP	0, R0			; Testo se falso
	BEQ	L2			; Se falso, vai para: L2
	MOV	[65376], R0		; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	MOV	[R4], [65372]		; Efetuo atribuição 2
	MOV	[65376], R0		; Movimento primeiro operador da adição para R0
	SUB	1, R0			; Efetuo subtração de Inteiros
	PUSH	R0			; Empilho temporária inteira
	POP	R0			; Desempilho resultado da expressão
	MOV	R0, [65374]		; Efetuo atribuição 1
L5:
	NOP				; Inicio do Enquanto
	MOV	0, R0			; Movimento primeira expressão simples para R0
	CMP	[65374], R0		; Efetuo comparação de Inteiros
	BGE	L7			; Compara se maior ou igual
	PUSH	0			; Falso
	JMP	L8			;  
L7:
	PUSH	1			; Verdadeiro
L8:
	NOP	 			;  
	MOV	[65374], R0		; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	MOV	[65372], R0		; Movimento primeira expressão simples para R0
	POP	R4			; Desempilho referência do vetor
	CMP	[R4], R0		; Efetuo comparação de Inteiros
	BGT	L9			; Compara se maior
	PUSH	0			; Falso
	JMP	L10			;  
L9:
	PUSH	1			; Verdadeiro
L10:
	NOP	 			;  
	POP	R0			; Desempilho temporária lógica
	POP	R1			; Desempilho temporária lógica
	AND	R1, R0			; Aplico conectivo lógico 'E' em R1
	PUSH	R0			; Empilho temporária lógica
	POP	R0			; Desempilho resultado da expressão
	CMP	0, R0			; Testo se falso
	BEQ	L6			; Se falso, vai para: L6
	MOV	[65374], R0		; Movimento primeiro operador da adição para R0
	ADD	1, R0			; Efetuo adição de Inteiros
	PUSH	R0			; Empilho temporária inteira
	POP	R0			; Desempilho posição do vetor em R0 
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	MOV	[65374], R0		; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R4			; Desempilho referência do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	[R4], [R1]		; Efetuo atribuição 2
	MOV	[65374], R0		; Movimento primeiro operador da adição para R0
	SUB	1, R0			; Efetuo subtração de Inteiros
	PUSH	R0			; Empilho temporária inteira
	POP	R0			; Desempilho resultado da expressão
	MOV	R0, [65374]		; Efetuo atribuição 1
	JMP	L5			; Volta a testar condição do enquanto: L5
L6:
	NOP				; fim do enquanto: L6
	MOV	[65374], R0		; Movimento primeiro operador da adição para R0
	ADD	1, R0			; Efetuo adição de Inteiros
	PUSH	R0			; Empilho temporária inteira
	POP	R0			; Desempilho posição do vetor em R0 
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R1			; Desempilho endereço do vetor
	MOV	[65372], [R1]		; Efetuo atribuição 2
	MOV	[65376], R0		; Movimento primeiro operador da adição para R0
	ADD	1, R0			; Efetuo adição de Inteiros
	PUSH	R0			; Empilho temporária inteira
	POP	R0			; Desempilho resultado da expressão
	MOV	R0, [65376]		; Efetuo atribuição
	JMP	L1			; Volta a testar condição do laço para: L1
L2:
	NOP				; fim do laço para: L2
	MOV	0, [65376]		; Efetuo atribuição
L11:
	NOP				; Inicio do Laço Para
	MOV	[65378], R0		; Movimento primeira expressão simples para R0
	CMP	[65376], R0		; Efetuo comparação de Inteiros
	BLE	L13			; Compara se menor ou igual
	PUSH	0			; Falso
	JMP	L14			;  
L13:
	PUSH	1			; Verdadeiro
L14:
	NOP	 			;  
	POP	R0			; Desempilho resultado da expressão
	CMP	0, R0			; Testo se falso
	BEQ	L12			; Se falso, vai para: L12
	MOV	[65376], R0		; Movimento posição do vetor para R0
	MOV	65398, R1		; Desempilho a base do vetor em R1 
	ASL	R0			; Multiplico por 2 
	SUB	R0, R1			; Subtraio o offset da base do vetor
	PUSH	R1			; Empilho endereço calculado do vetor
	POP	R4			; Desempilho referência do vetor
	MOV	[R4], R0		; Movimento expressão a escrever para R0
	MOV	C0, R1			; move para R1, o endereço da posição onde a variavel será convertida
	JSR	#ITOA			; Converte de inteiro para cadeia de caracteres
	MOV	C0, R0			; Move o endereço do que se quer escrever
	MOV	1, R1			; Move a posição inicial default (1) para escrever
	JSR	#EXIBE			; Exibe
	MOV	[65376], R0		; Movimento primeiro operador da adição para R0
	ADD	1, R0			; Efetuo adição de Inteiros
	PUSH	R0			; Empilho temporária inteira
	POP	R0			; Desempilho resultado da expressão
	MOV	R0, [65376]		; Efetuo atribuição
	JMP	L11			; Volta a testar condição do laço para: L11
L12:
	NOP				; fim do laço para: L12

#FIM_PRINCIPAL:
	POP	R4			; Restauro estado da máquina
	POP	R3			; Restauro estado da máquina
	POP	R2			; Restauro estado da máquina
	POP	R1			; Restauro estado da máquina
	POP	R0			; Restauro estado da máquina
	POP	R5			; Restaura o Base Pointer da Função chamadora
	RTS


C0:
	"          "