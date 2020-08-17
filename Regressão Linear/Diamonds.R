#library
require(tidyverse)

#data
data(diamonds)
diamonds

#plot
plot(diamonds$carat, diamonds$price)
plot(log(diamonds$carat), log(diamonds$price))

#O gráfico plot acima mostra um reta entre as duas variaveis, indicando
#que existe um relacionamento entre essas duas variaveis e uma pode
#servir para prever a outra.
#Pode-se medir o grau de correlação entre as variaveis caso haja necessidade
#com a função corr().
#Caso não houvesse nenhuma correlção o mlehor valor possível seria o
#valor médio.


#model linear regression
diamonds.lm <- lm(log(price) ~ log(carat), data = diamonds)
summary(diamonds.lm)

#Vemos que a variavel carat possui p-valor menor que 0.005, indicando que
#a variavel é uma boa preditora, significativamente diferente de 0.

#Com isso temos um modelo com a seguinte formula:
#log(price) = 8.448661 + 1.675817 * log(carat)

#Prevendo o preçco do diamante sendo que o log de carat ogual a 0.5
price_diamond = exp(8.448661 + 1.675817 * 0.5)
price_diamond

#Verificando as suposições
par(mfrow = c(2,2))
plot(diamonds.lm, which = c(1:4), pch = 20)

#Podemos utilizar este gráfico para observar a independência e a homocedasticidade,
#se os resíduos se distribuem de maneira razoavelmente aleatória e com mesma amplitude em torno do zero.

#No segundo gráfico, podemos avaliar a normalidade dos resíduos. 

#O terceiro gráfico pode ser avaliado da mesma maneira que o primeiro, observando a aleatoriedade e amplitude, 
#desta vez dos resíduos padronizados. 

#O quarto gráfico é as Distâncias de Cook das observações, 
#uma medida de influência que pode indicar a presença de outliers 
#quando possui valor maior do que 1.

#Alguns teste estatísticos para comprovar as suposições

#Teste de bartlett - Verifica a homegeneidade das variâncias
#Ho: As variaveis dos erros são homogêneas

#Teste de Shapiro-Wilk
#Avalia a aderência dos resíduos à distribuição Normal
#Ho: A amostra provém de uma população normal


