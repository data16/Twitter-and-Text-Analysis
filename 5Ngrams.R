##bi/tri-grams
#Toeknis with quanteda 
#Reads the file and assigns to file path
#replace the stop words part with the following to remove your own stop works...   ignoredFeatures=c("","",stopwords("en")) 

token1dfm <- dfm(text, toLower=TRUE, removeNumbers=TRUE, removePunct = TRUE, removeSeparators=TRUE, removeTwitter=TRUE, stem=TRUE, ignoredFeatures=stopwords("en"), ngrams=1)
topfeatures(token1dfm)
plot(token1dfm, max.words=100, colors=brewer.pal(8, "Dark2"))

token2dfm <- dfm(text, toLower=TRUE, removeNumbers=TRUE, removePunct = TRUE, removeSeparators=TRUE, removeTwitter=TRUE, stem=TRUE, ignoredFeatures=stopwords("en"), ngrams=2)
topfeatures(token2dfm)
plot(token2dfm, max.words=100, colors=brewer.pal(8, "Dark2"))

token3dfm <- dfm(text, toLower=TRUE, removeNumbers=TRUE, removePunct = TRUE, removeSeparators=TRUE, removeTwitter=TRUE, stem=TRUE, ignoredFeatures=stopwords("en"), ngrams=3)
topfeatures(token3dfm)
plot(token3dfm, max.words=100, colors=brewer.pal(8, "Dark2"))

token4dfm <- dfm(text, toLower=TRUE, removeNumbers=TRUE, removePunct = TRUE, removeSeparators=TRUE, removeTwitter=TRUE, stem=TRUE, ignoredFeatures=stopwords("en"), ngrams=4)
topfeatures(token4dfm)
plot(token4dfm, max.words=100, colors=brewer.pal(8, "Dark2"))

#Put the chosen word into context by displaying where it appears in the text 
kwic(text, "")
