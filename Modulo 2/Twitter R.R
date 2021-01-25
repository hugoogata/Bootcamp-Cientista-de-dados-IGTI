## Documentação do rtweet 
install.packages("rtweet") # caso não tenha biblioteca instalada
library(rtweet) #Usa a API do twitter

setwd("C:\users\HugoKenzo\Documents\GitHub\R\TwitteR")

# Autenticação
toke <- create_token(app = "Pimeiro Exemplo IGTI",
                     consumer_key<-"yuzf4b4zgEFYpYLXYVy8oQsi6",
                     consumer_secret <-"1yTILz3WGvhwbnTtHBtNfXYXgV6iMc1JKaXBkZo6ZKOW87290g",
                     access_token<-"1266052658021961734-WvTuAy62qq9BDBQlqfl5pFZhZLYaRt",
                     access_secret<-"ZBwwpMdLeR5H80nRzS3Js5BgUivn3PvBTcMlxMsNBc3uq")

# Parametros de busca
screen_name <- "jairbolsonaro"
no.of.tweets = 1000 #numero de tweets solicitados 1000
 
# Buscando
tweets <- get_timeline(screen_name, n=1000, include_rts=TRUE, exclude_replies=TRUE) 
 
# Salvando o vertor de tweets como csv e apenas o texto em txt na codificação do portugues
write_as_csv(tweets, "tweetsByNameRawdata.csv", fileEncoding = "latin1//TRANSLIT")

##plota a serie temporal dos tweets
ts_plot(tweets, "3 hours") +
  ggplot2::theme_minimal() +
  ggplot2:::theme(plot.tittle = ggplo2::element_text (face ="bold")) +
  ggplot2::labs (
    x=NULL, y = NULL,
    title = "Frequencia de tweets da conta 'jairbolsonaro' nos ultimoa 9 didas",
    subtitle = "contagaem de tweets agregados em intervalos de 3 horas",
    caption ="\nfonte: Dados coletados do Twitter com o pacote rtweet"
  )