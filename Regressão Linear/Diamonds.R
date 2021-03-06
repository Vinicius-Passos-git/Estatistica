#library
require(tidyverse)

#data
data(diamonds)
diamonds

#plot
plot(diamonds$carat, diamonds$price)
plot(log(diamonds$carat), log(diamonds$price))

#O gr�fico plot acima mostra um reta entre as duas variaveis, indicando
#que existe um relacionamento entre essas duas variaveis e uma pode
#servir para prever a outra.
#Pode-se medir o grau de correla��o entre as variaveis caso haja necessidade
#com a fun��o corr().
#Caso n�o houvesse nenhuma correl��o o mlehor valor poss�vel seria o
#valor m�dio.


#model linear regression
diamonds.lm <- lm(log(price) ~ log(carat), data = diamonds)
summary(diamonds.lm)

#Vemos que a variavel carat possui p-valor menor que 0.005, indicando que
#a variavel � uma boa preditora, significativamente diferente de 0.

#Com isso temos um modelo com a seguinte formula:
#log(price) = 8.448661 + 1.675817 * log(carat)

#Prevendo o pre�co do diamante sendo que o log de carat ogual a 0.5
price_diamond = exp(8.448661 + 1.675817 * 0.5)
price_diamond

#Verificando as suposi��es
par(mfrow = c(2,2))
plot(diamonds.lm, which = c(1:4), pch = 20)

#Podemos utilizar este gr�fico para observar a independ�ncia e a homocedasticidade,
#se os res�duos se distribuem de maneira razoavelmente aleat�ria e com mesma amplitude em torno do zero.

#No segundo gr�fico, podemos avaliar a normalidade dos res�duos. 

#O terceiro gr�fico pode ser avaliado da mesma maneira que o primeiro, observando a aleatoriedade e amplitude, 
#desta vez dos res�duos padronizados. 

#O quarto gr�fico � as Dist�ncias de Cook das observa��es, 
#uma medida de influ�ncia que pode indicar a presen�a de outliers 
#quando possui valor maior do que 1.

#Alguns teste estat�sticos para comprovar as suposi��es

#Teste de bartlett - Verifica a homegeneidade das vari�ncias
#Ho: As variaveis dos erros s�o homog�neas

#Teste de Shapiro-Wilk
#Avalia a ader�ncia dos res�duos � distribui��o Normal
#Ho: A amostra prov�m de uma popula��o normal


