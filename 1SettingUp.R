#Install packages ("streamR", "RCurl", "ROAuth", "RJSONIO", "stringr")

#Twitter API credentials and Handshake
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- " "
consumerSecret <- " "

my_oauth <- OAuthFactory$new(consumerKey = consumerKey,
                             consumerSecret = consumerSecret,
                             requestURL = requestURL,
                             accessURL = accessURL,
                             authURL = authURL)

my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

#Run the above section of code separatly before moving on to the next!
#Twitter will give you a code to type into the console
save(my_oauth, file="my_oauth.Rdata")