#importando as librarys
library("rnn")
library("ggplot2")

#importando dados

weatherAUS = read.csv("weatherAUS.csv")

#extrair somente colunas 1 and 14  e primeiras 3040 linhas (Albury location), informações
#de humidade as 15pm e as 9am para o municipio de Albury
data <- weatherAUS[1:3040, 14:15]

# resumo estatisco para analisar o df
summary(data)

#pré-processamento
data_cleaned <-  na.omit(data)

#Só 3000 linhas para processar mais rapido e podermos dividir por 30 a seguir
#Explicar conceito de dado de entrada em RNN
data_used <- data_cleaned[1:3000,]

x <- data_used[,1]
y <- data_used[,2]

head(x)
head(y)

#criando uma matriz, com esse processo eu crio um df com trinta linha por coluna da  variavel x
X <- matrix(x, nrow = 30)
Y <- matrix(y, nrow = 30)

#Min Max Scale para transformar os valores entre 0 e 1
Xscaled <- (X - min(X)) / (max(X) - min(X))
X <- Xscaled

Yscaled <- (Y - min(Y)) / (max(Y) - min(Y))
Y <- Yscaled

#train teste split
train=1:80
test=81:100

#treinando a RNN
set.seed(12) 

model <- trainr(Y = Y[, train], #target
                X = X[, train], #features
                learningrate = 0.01, #podemos testar varios valores
                hidden_dim = 15, #tbm podemos adicionar varias camadas
                network_type = "rnn", #tbm posso usar: lstm, gru
                numepochs = 100) #o msm para o numero de epocas 

#plotando os erros do modelo
plot(colMeans(model$error), type = 'l', xlab = 'epoch', ylab = 'errors')

#precição
Yp <- predictr(model,X[, test])

#função para obter  o grau de ajuste que é o quanto % Yp expllica a variacia do Y teste
rsq <- function(y_actual,y_predito){
  cor(y_actual,y_predito)^2
}

#construindo um df com os resultaos
Ytest <- matrix(Y[, test], nrow = 1)
Ytest <- t(Ytest)
Ypredicted <- matrix(Yp, nrow = 1)
Ypredicted <- t(Ypredicted)

result_data <- data.frame(Ytest)
result_data$Ypredicted <- Ypredicted

#aplicando a função rsq no df
rsq(result_data$Ytest, result_data$Ypredicted)

# tivemos um resultado de 0.62 este resultado pode ser maior com mais testes

#criando gráfico para explicar visualmente a correlação
plot(as.vector(t(result_data$Ytest)), col = 'red', type='l',
     main = "Actual vs Predicted Humidity: testing set",
     ylab = "Y,Yp")
lines(as.vector(t(Yp)), type = 'l', col = 'black')
legend("bottomright", c("Actual", "Predicted"),
       col = c("red","black"),
       lty = c(1,1), lwd = c(1,1))

