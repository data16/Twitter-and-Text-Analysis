#Text Analysis 
setwd("~/Documents/W/R")

#Unfortunately there are a lot of R libraries to install for the code to work properly 
library(lda)
library(SnowballC)
library(tm)
library(ggplot2)
library(topicmodels)
library(stringr)
library(cluster)
library(tokenizers)
library(wordcloud)
library(wordcloud2)
library(slam)
library(streamR)
library(RCurl)
library(quanteda)
library(plyr)
library(NLP)
library(Matrix)
library(MASS)

#Reads the file and assigns to file path, then makes it into a text corpus.
filePath <- "tweets.json"
text <- parseTweets(filePath)
text <- text$text
# Load the data as a corpus
text  <- iconv(enc2utf8(text),sub="byte")
text <- sapply(text, function(row) iconv(row, "latin1","ASCII", sub=""))
docs <- Corpus(VectorSource(text))

#Are useful to see if the data has been read in properly without errors 
inspect(docs)
summary(docs)

##Text transformation; removes particular symbols, and chages them to a space instead. 
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

##Clean text
# Convert the text to lower case (either command is fine)
docs <- tm_map(docs, content_transformer(tolower))
#docs <- tm_map(docs, tolower)

#Remove numbers
docs <- tm_map(docs, removeNumbers)

#Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))

#Remove your own stop word
#specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("think", "t.co", "https", "thing", "get", "just", "can", "one", "lot", "got", "yeah", "bit", "say", "actual", "come", "year", "might", "probabl", "way", "done", "day", "kind", "will", "also", "back","you'r","you're")) 

#Remove punctuations
docs <- tm_map(docs, removePunctuation)

#Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)

#Text stemming
docs <- tm_map(docs, stemDocument)

##Document term matrix, which describes the frequency of the words in the text
dtm <- TermDocumentMatrix(docs)

#Sorts to give a list of most common words and their frequencies (mostly head displays this)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(v, 30)

##Makes word cloud
#'min.freq' is miminum of words requires to be on word cloud
#'max.words' is how many words at most wanted for the word cloud 
#'#colours can also be changed on the 'colors=' parameter 
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,max.words=150, random.order=FALSE, rot.per=0.35, colors=brewer.pal(8, "Dark2"))