#Tabla de Contingencia  
#                   Divorciados     No Divorciados
#Fumadores            73                12
#No Fumadores         43                39

#H0: No existe asociación entre las variables categóricas
#H1: Existe asociación entre las variables categóricas

divorciado=c(73,43)
nodivorciado=c(12,39)

cuadro=cbind(divorciado,nodivorciado) #Tambien funciona data.frame()
row.names(cuadro)= c("fumadores","no fumadores")
prop.table(cuadro)

barplot(prop.table(cuadro), main = "Comparison",
        legend=c("fumadores","no fumadore"),
        xlab= "Estado Civil", beside = TRUE)
        )
#df= (nr-1)*(nc-1)=1
chisq= chisq.test(cuadro)

chisq
#X-squared = 20.458, df = 1, p-value = 6.097e-06
# pvalue < 0,05 , Rechazar Ho por lo que aceptamos H1 (existe asociación sign.)

chisq$expected

#Cuales son las celdas que mas contribuyen para determinar la asociación
round(chisq$residuals,3)

#Resultados
#divorciado nodivorciado
#[1,]      1.817       -2.740
#[2,]     -1.849        2.789
#Cuando los signos son positivos, la asociación es mayor. La mayoria de los divorciados
# fuman, quienes no son divorciados no fuman.



