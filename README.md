# LED-STM32F103C8
Treinando instruções de GPIO em Assembly para a arquiterura ARM do STM32F10xxx

Os códigos visam fixar o aprendizado de programação com as portas GPIO do microprocessador citado. A ideia do primeiro código (Pisca_LEDS) é controlar todos os leds simultaneamente e o do segundo (Passa_LEDS) é fazer a passagem da esquerda para a direita de cada LED por vez.

No primeiro código, os LEDS iniciam apagados por carregar todos os Outputs Data Register (ODR) em 0. Após uma função delay para que seja possível ver a transição entre apagado e acesso, o ODR é carregado com nível lógico alto e assim os LEDS são acessos. Dentro de um loop, é garantido que os LEDS ficarão ininterrupdamente nesse estado. 
A fim de ilustrar melhor, a imagem a seguir descreve os ODRs no microprocessador em questão. 
<body>
<p>
<img alt="ODR-STM32F103" src="https://imgur.com/amJ3IQc.png">
 </p>
 </body>
