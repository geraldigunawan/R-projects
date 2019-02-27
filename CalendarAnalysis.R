calendar <- read.csv("Datasets/calendar.csv", header = TRUE)

calendar_not_365 <- table(calendar$listing_id)
calendar_not_365[calendar_not_365 != 365]

#getting only available days for each listing
listing_available <- subset(calendar, available == "t", )
head(listing_available)
table(listing_available$listing_id)
length(listing_available$listing_id)

rm(listing_available)
rm(listing_avaiable)

#exercise 1: check available listing until 01/06/2019
str(listing_available$date)
listing_available$date <- as.POSIXct(as.character(listing_available$date), "%d-%m-%y")
str(listing_available)
colnames(listing_available)
listing_available$date2 <- NULL
tail(listing_available)
listing_available_till_june <- subset(listing_available, date <= "2019-06-01" & date > as.character(Sys.Date()), )
length(listing_available_till_june$listing_id)
tail(listing_available_till_june)
listing_available_till_june[order(-listing_available_till_june$listing_id),]
subset(listing_available_till_june, listing_id == 30545978, )$date
length(subset(listing_available_till_june, listing_id == 30545978, )$listing_id)
#result
table(listing_available_till_june$listing_id)
colnames(listing_available_till_june)

#exercise 2
length(unique(listings_summary$host_id))
listing_id_available_till_june <- as.vector(unique(listing_available_till_june$listing_id))
listing_id_available_till_june

listing_id_in_summary <- listings_summary$id
listing_id_in_summary

total_listing <- c(listing_id_available_till_june, listing_id_in_summary)
total_listing[duplicated(total_listing)]
