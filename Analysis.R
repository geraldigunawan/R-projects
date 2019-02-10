calendar <- read.csv("calendar.csv", header = TRUE)
listings <- read.csv("listings.csv", header = TRUE)
neighbourhoods <- read.csv("neighbourhoods.csv", header = TRUE)
reviews <- read.csv("reviews.csv", header = TRUE)
listings_summary <- read.csv("listings-summary.csv", header = TRUE)
reviews_summary <- read.csv("reviews-summary.csv", header = TRUE)

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

#create a new data frame called my.data after filtering from dataset
my.data <- listings_summary[,-5] #removing 5th column: neighbourhood_group
colnames(my.data)

#combining two vectors
listings_colnames <- colnames(listings)
listingssummary_colnames <- colnames(listings_summary)
#create new vector from a combination of vectors
x <- c(listings_colnames,listingssummary_colnames)
x
#check duplicated value within x
x[duplicated(x)]

#check first few data in dataset, and check last data
head(listings)
tail(listings)

#select a particular record using certain condition
subset(listings, id == 9835, select=c(host_id,host_name,host_since))

#count number of rows per host_id (to check how may listings have been done)
total_listing <- table(listings_summary$host_id)
total_listing[total_listing > 30]

subset(listings_summary, calculated_host_listings_count > 30, select=c(host_id,host_name))



