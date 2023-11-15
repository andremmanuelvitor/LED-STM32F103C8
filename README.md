# LED-STM32F103C8
Treinando instruções de GPIO em Assembly para a arquiterura ARM do STM32F10xxx

Os códigos visam fixar o aprendizado de programação com as portas GPIO do microprocessador citado. A ideia do primeiro código (Pisca_LEDS) é controlar todos os leds simultaneamente e o do segundo (Passa_LEDS) é fazer a passagem da esquerda para a direita de cada LED por vez.

Ambos os códigos inicializam registros importantes para o setup. São inicializados CRL e CRH, Configuration Register Low e Configuration Register High, respectivamente. Eles são responsáveis pela informação de como a porta será utilizada. Sendo necessário configurar os parâmetros MODE e CNF (Configuration Flag). Neste caso, o valor 0x33333333 foi carregado para o CRL e o CRH, assim é informado ao processador que ele é utilizado como saída de 50MHz e o CNF recebe a informação de que será saída push-pull. Essas informações podem ser obtidas pelo manual STM32F10xxx.

No primeiro código, os LEDS iniciam apagados por carregar todos os Outputs Data Register (ODR) em 0 (0x0000). Após uma função delay para que seja possível ver a transição entre apagado e acesso, o ODR é carregado com nível lógico alto (0xFFFF) e assim os LEDS são acessos. Dentro de um loop, é garantido que os LEDS ficarão ininterrupdamente nesse estado. 
A fim de ilustrar melhor, a imagem a seguir descreve os ODRs no microprocessador em questão: 

<img alt="ODR-STM32F103" src="https://imgur.com/amJ3IQc.png">

Por particularidades do placa em questão, está sendo usados 16bits para a utilização dos leds. Assim, os sinalizando de ODR0 a ODR15.

O segundo código é muito similar ao primeiro. No entanto, a posição de memória dos LEDS (consulta feita via datasheet) foram informadas no ínicio para facilitar o desenvolvimento. No Loop há uma diferença também, para garantir a condição definida no ínicio. Dessa maneira o STRH garante sempre a leitura individual das regiões de memória dos LEDS, com um salto de 2 posições, já que são WORDS armazenadas com os bits menos significativos primeiro.

## English Version

# LED-STM32F103C8
Training GPIO instructions in Assembly for the STM32F10xxx ARM architecture

The codes are intended to teach you how to program the GPIO ports of the microprocessor mentioned. The idea of the first code (Blink_LEDS) is to control all the LEDs simultaneously and the second (Pass_LEDS) is to switch from left to right for each LED in turn.

Both codes initialize important registers for setup. They initialize CRL and CRH, Configuration Register Low and Configuration Register High, respectively. They are responsible for providing information on how the port will be used. It is necessary to configure the MODE and CNF (Configuration Flag) parameters. In this case, the value 0x33333333 has been loaded into the CRL and CRH, so the processor is told that it will be used as a 50MHz output and the CNF is told that it will be a push-pull output. This information can be obtained from the STM32F10xxx manual.

In the first code, the LEDS start off off by loading all the Outputs Data Register (ODR) to 0 (0x0000). After a delay function so that it is possible to see the transition between off and on, the ODR is loaded with a high logic level (0xFFFF) and so the LEDS are on. Within a loop, the LEDs are guaranteed to remain in this state uninterruptedly. 
To illustrate this, the following image describes the ODRs in the microprocessor in question:

<img alt="ODR-STM32F103" src="https://imgur.com/amJ3IQc.png">

Due to the particularities of the board in question, 16bits are being used for the LEDs. Thus, signaling them from ODR0 to ODR15.

The second code is very similar to the first. However, the memory locations of the LEDs (consulted via the datasheet) have been entered at the beginning to make development easier. There is also a difference in the Loop to guarantee the condition defined at the beginning. In this way, STRH always guarantees the individual reading of the LEDS memory regions, with a jump of 2 positions, since WORDS are stored with the least significant bits first.
