library(streamR)
load("my_oauth.Rdata")
library(twitteR)

filterStream(file.name = "tweetsGBBO.json", # Save tweets in a json file
             track = c("GBBO","Bake Off", "Great British Bake Off", "The Great British Bake Off"),
             #location = c(,,,), #lat/lon pairs of SW and NE corner of each box
             language = "en",
             timeout = 3600, # Keep connection alive for specified seconds 1 hour=3600 
             #tweets = 10,
             oauth = my_oauth, # Use my_oauth file as the OAuth credentials
             verbose = TRUE)

#Uses streamR 
tweetsPARSED <- parseTweets("tweetsGBBO.json", simplify = FALSE, verbose = TRUE) 
#47,813 tweets
