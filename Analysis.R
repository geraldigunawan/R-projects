library(ggplot2)
calendar <- read.csv("Datasets/calendar.csv", header = TRUE)
listings <- read.csv("Datasets/listings.csv", header = TRUE)
neighbourhoods <- read.csv("Datasets/neighbourhoods.csv", header = TRUE)
reviews <- read.csv("Datasets/reviews.csv", header = TRUE)
listings_summary <- read.csv("Datasets/listings-summary.csv", header = TRUE)
reviews_summary <- read.csv("Datasets/reviews-summary.csv", header = TRUE)

#%%
datasets <- c('calendar','listings','neighbourhoods', 'reviews','listing_summary','reviews_summary')
for (dataset in datasets){
  print(paste("dataset", dataset))
}

#check column names
colnames(listings_summary)

#check null values in one particular column/vector
any(is.na(listings_summary$number_of_reviews))

#display how many NAs in one particular column
table(is.na(listings_summary$neighbourhood))

#describe a column
str(listings_summary$number_of_reviews)

#decsribe all unique content of a column
df <- as.data.frame(table(listings_summary$neighbourhood))
# Rename a column in R
colnames(df)
colnames(df)[colnames(df)=="Var1"] <- "Neighbourhood"
colnames(df)[colnames(df)=="Freq"] <- "TotalListing"
df
bargraph <- ggplot(df,aes(x=Neighbourhood,y=TotalListing))+geom_bar(stat="identity")
bargraph + theme(axis.text.x = element_text(angle = 90, hjust = 1))
#save a picture to current working directory
jpeg('Diagrams/Listings based on neighbourhood.jpg')
plot(bargraph + theme(axis.text.x = element_text(angle = 90, hjust = 1)))
dev.off()

#count
unique(listings_summary$neighbourhood)
length(unique(listings_summary$neighbourhood))

#create a new data frame called my.data after filtering from dataset
my.data <- listings_summary[,-5] #removing 5th column: neighbourhood_group
colnames(my.data)

#combining two dataframes
listings_colnames <- colnames(listings)
listingssummary_colnames <- colnames(listings_summary)
#create new vector from a combination of vectors
x <- c(listings_colnames,listingssummary_colnames)
x
#check duplicated value within x
x[duplicated(x)]

#check first few data in dataset, and check last data
head(listings_summary)
tail(listings_summary)

#select a particular record using certain condition
subset(listings, id == 9835, select=c(host_id,host_name,host_since))

#count number of rows per host_id (to check how may listings have been done)
total_listing <- table(listings_summary$host_id)
total_listing
total_listing[total_listing > 30]

longlat <- subset(listings_summary, longitude > 145, select=c(longitude,latitude))
#longlat2 <- listings_summary[which(listings_summary$longitude | listings_summary$latitude),]
longlat
#longlat2
str(longlat)
any(is.na(longlat$latitude))

rm(name)

#Exercise 1: Get prices for all private room with minimum stay of 1 night
onenight <- subset(listings_summary, minimum_nights ==1, select=c(room_type,price,minimum_nights))
str(onenight)
onenight_private <- onenight[grep("rivate",onenight$room_type),]
str(onenight_private)
#order price ascending
onenight_private_price <- onenight_private[order(onenight_private$price),]
#order price descending
onenight_private_price <- onenight_private[order(-onenight_private$price),]
str(onenight_private_price)

#Exercise 2: Classify price > 150 as high, price in between 60 to 149 as middle, below 60 as low
onenight_private_price$grade[onenight_private_price$price >= 170] <- "High"
onenight_private_price$grade[onenight_private_price$price <= 169 & onenight_private_price$price >= 60 ] <- "Middle"
onenight_private_price$grade[onenight_private_price$price < 60 ] <- "Low"
onenight_private_price
tail(onenight_private_price)
str(onenight_private_price)
count_grade <- as.data.frame(table(onenight_private_price$grade))
count_grade
colnames(count_grade)[colnames(count_grade)=="Var1"] <- "Grade"
colnames(count_grade)[colnames(count_grade)=="Freq"] <- "Total"
listing_per_grade <- ggplot(count_grade, aes(x=factor(Grade), y = Total)) + geom_bar(stat="identity") + scale_x_discrete(limits=c("Low", "Middle", "High"))
listing_per_grade
jpeg('Diagrams/listing_per_grade.jpg')
plot(listing_per_grade)
dev.off()
