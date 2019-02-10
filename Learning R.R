#%%
calendar <- read.csv("calendar.csv", header = TRUE)
listings <- read.csv("listings.csv", header = TRUE)
neighbourhoods <- read.csv("neighbourhoods.csv", header = TRUE)
reviews <- read.csv("reviews.csv", header = TRUE)
listings_summary <- read.csv("listings-summary.csv", header = TRUE)
reviews_summary <- read.csv("reviews-summary.csv", header = TRUE)

#%%list column names
colnames(calendar)
colnames(listings)
colnames(listings_summary)
colnames(neighbourhoods)
colnames(reviews)
colnames(reviews_summary)

#check first few data in dataset
head(listings)

#select a particular record using certain condition
subset(listings, id == 9835, select=c(host_id,host_name,host_since))

#count number of rows per host_id (to check how may listings have been done)
total_listing <- table(listings_summary$host_id)
total_listing[total_listing > 30]

subset(listings_summary, calculated_host_listings_count > 30, select=c(host_id,host_name))

