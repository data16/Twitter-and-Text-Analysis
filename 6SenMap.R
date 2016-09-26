#Sentiment Heat map
#have your tweets with encoding changed saved to "text"
##Sentiment 
install.library(syuzhet)
library(syuzhet)

#Get sentiment values into "sen"
sen <- get_sentiment(text, method="afinn") #Developed for Twitter tweets

#Make "sen" a data frame so it is easier to work with
sen <- as.data.frame(sen)

#Scale the scores to make getting the colour scale easier 
sen <- 5*sen/(max(max(sen),abs(min(sen))))

#Output the score to an spreadsheet 
SenAndText <- cbind(sen,text)
SenAndText <- as.data.frame(SenAndText)
colnames(SenAndText) <- c("Sentiment","Text")
write.csv(SenAndText,"SenAndText.csv")

##Geo mapping
#get the latatude and longatude and get a map to plot onto
place <- tweets[37:38]
require(mapdata)
library(mapdata)
require(rworldmap)
library(rworldmap)
newmap <- getMap(resolution="high")

##Map with points for sentiment
plot(newmap, xlim=c(-6,0), ylim=c(50,60), asp=1) #UK map
#plot(newmap, xlim=c(-10,10), ylim=c(30,70), asp=1) #Europe ish
#plot(newmap, xlim=c(,), ylim=c(,), asp=1) #World map

##Plots points onto map
points(place$place_lon, place$place_lat, col=heat.colors(sen$sen+6), pch=20)
legend("topright",title="Sentiment",legend=c("Negative", "Neutral","Positive"),fill=c("red","orange","yellow"))
