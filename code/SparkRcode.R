# Read in NPI data
NPIdata <- read.csv("npidata_20050523-20150913.csv", nrow=2000)

# Subset down to NPI & postal code (i.e. zip) of practice location, rename
NPIdata <-NPIdata[,c("NPI","Provider.Business.Practice.Location.Address.Postal.Code")]
names(NPIdata)[2]<-"Practice_Postal_Code"


# Read in prescriber data & provide column names
Rxdata <- read.table("Physician-Referrals-2012-2013-DAYS30.txt", sep=",", nrow=2000)
names(Rxdata) <- c("NPI", "NPI_2", "pair_count", "bene_count", "same_day_count")

# Modifying data so that a subset of NPIs appear in both of the smaller code-testing datasets
sampleNPI<-sample(NPIdata$NPI,2000, replace=TRUE)
Rxdata$NPI<-sampleNPI

# Write out .csv files
write.csv(Rxdata, "test_Rx.csv", row.names=FALSE)
write.csv(NPIdata, "test_NPI.csv", row.names=FALSE)

