# LED-STM32F103C8
Treinando instruções de GPIO em Assembly para a arquiterura ARM do STM32F10xxx

Os códigos visam fixar o aprendizado de programação com as portas GPIO do microprocessador citado. A ideia do primeiro código (Pisca_LEDS) é controlar todos os leds simultaneamente e o do segundo (Passa_LEDS) é fazer a passagem da esquerda para a direita de cada LED por vez.

Ambos os códigos inicializam registros importantes para o setup. São inicializados CRL e CRH, Configuration Register Low e Configuration Register High, respectivamente. Eles são responsáveis pela informação de como a porta será utilizada. Sendo necessário configurar os parâmetros MODE e CNF (Configuration Flag). Neste caso, o valor 0x33333333 foi carregado para o CRL e o CRH, assim é informado ao processador que ele é utilizado como saída de 50Mhz e o CNF recebe a informação de que será saída push-pull. Essas informações podem ser obtidas pelo manual ST32F10xxx.

No primeiro código, os LEDS iniciam apagados por carregar todos os Outputs Data Register (ODR) em 0 (0x0000). Após uma função delay para que seja possível ver a transição entre apagado e acesso, o ODR é carregado com nível lógico alto (0xFFFF) e assim os LEDS são acessos. Dentro de um loop, é garantido que os LEDS ficarão ininterrupdamente nesse estado. 
A fim de ilustrar melhor, a imagem a seguir descreve os ODRs no microprocessador em questão: 

<img alt="ODR-STM32F103" src="https://imgur.com/amJ3IQc.png">

Por particularidades do placa em questão, está sendo usados 16bits para a utilização dos leds. Assim, os sinalizando de ODR0 a ODR15.

O segundo código é muito similar ao primeiro. No entanto, a posição de memória dos LEDS (consulta feita via datasheet) foram informadas no ínicio para facilitar o desenvolvimento. No Loop há uma diferença também, para garantir a condição definida no ínicio. Dessa maneira o STRH garante sempre a leitura individual das regiões de memória dos LEDS, com um salto de 2 posições, já que são WORDS armazenadas com os bits menos significativos primeiro.
