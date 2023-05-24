RCC_APB2ENR EQU 0x40021018
GPIOA_CRL 	EQU	0x40010800
GPIOA_CRH	EQU 0x40010804
GPIOA_ODR	EQU 0x4001080C
	
AFIO_MAPR	EQU 0x40010004 ;remapear a JTAG para usar o LED4 (conforme diagrama)	
	AREA codigo, CODE, READONLY
__main
	LDR R0, =RCC_APB2ENR
	LDR R1, [R0]
	ORR R1, R1, #0xFD ;habilitação dos IO de PA até PF (mas sendo usado apenas A) e também do AFIO para desabilitar JTAG
	STR R1, [R0]
	
	LDR R0, =GPIOA_CRL 
	LDR R1, =0x33333333 ;habilitando nivel baixo como saída 50MHz e CNF como saida push-pull para GP
	STR R1, [R0]
	
	LDR R0, =GPIOA_CRH
	LDR R1, =0x33333333 ;habilitando nivel alto como saída 50MHz e CNF como saida push-pull para GP
	STR R1, [R0]
	
	;DESABILITANDO JTAG PARA USAR O LED4 QUE ESTÁ MULTIPLEXADO COM ELE
	LDR R0, =AFIO_MAPR
	LDR R1, =0x02000000
	STR R1, [R0]
	
LOOP

	LDR R0, =GPIOA_ODR
	LDR R1, =0x0000 ;garantindo nivel lógico baixo para a saida de dados
	STR R1, [R0]
	BL delay
	
	LDR R0, =GPIOA_ODR
	LDR R1, =0xFFFF ;garantindo nivel logico alto para a saida de dados
	STR R1, [R0]
	BL delay
	B LOOP

delay
	 LDR R0,=48
d_L1 LDR R1,=250000
d_L2 SUBS R1, R1, #1
	 BNE d_L2
	 SUBS R0, R0, #1
	 BNE d_L1
	 BX LR
	 END
