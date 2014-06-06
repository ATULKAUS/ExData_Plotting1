#Reading data
hpc<-read.csv2("household_power_consumption.txt")
# subsetting for the two dates
d<-grep("^[1-2]/2/2007",as.character(hpc[,1]))
hpc_final<-hpc[c(d),]
dim(hpc_final)
#Formatting the columns, setting dates, numerics etc
hpc_final[,1]<-as.Date(hpc_final[,1],"%d/%m/%Y")
head(hpc_final[,1])
for ( i in 3:9){
  hpc_final[,i]<-as.numeric(as.character(hpc_final[,i]))
}
hpc_final[,10]<-as.POSIXct(paste(hpc_final[,1],hpc_final[,2]),format="%Y-%m-%d %H:%M:%S")
#First Plot
png("plot1.png",bg="transparent",width=480,height=480,units="px")
hist(hpc_final[,3],cex.axis=0.8,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",cex.lab=0.9,cex.main=1,col="red")
dev.off()
