##LDA with a Gibbs sampler 
#Can change how many ittereations by adjusting 'iter'
#Can change how many topics for the data to be explained by
burnin <- 4000
iter <- 2000
thin <- 500
seed <-list(2003,5,63,100001,765)
nstart <- 5
best <- TRUE
#Number of topics
k <- 10
#Run LDA using Gibbs sampling
ldaOut <-LDA(dtm,k, method="Gibbs", control=list(nstart=nstart, seed = seed, best=best, burnin = burnin, iter = iter, thin=thin))
#ldaOut <-LDA(,k, method="Gibbs", control=list(nstart=nstart, seed = seed, best=best, burnin = burnin, iter = iter, thin=thin))

#Write out results of LDA
#Gives output for which topic each word belongs to 
ldaOut.topics <- as.matrix(topics(ldaOut))
#ldaOut.topics

#This sorts the words so they are grouped by topic rather than being plainly alphabetical 
ldaOut.topics.sorted <- sort(ldaOut.topics[,1],decreasing=TRUE)
#ldaOut.topics.sorted 

lda.topics.sorted <- cbind(rowSums(m), ldaOut.topics)
write.csv(lda.topics.sorted, file="ldatopicssorted.csv")