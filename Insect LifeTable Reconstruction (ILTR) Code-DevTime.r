#Dorcas Kareithi
#Insect Life Table Reconstrustion Code
#An algorithm that reconstructs the insect life tables based on pulished literature.

################################################################################################################
################################################################################################################
#Example 1 Khalodi et al, 2014- C Partellus
setwd("C:\\Users\\Evidence Action\\Desktop\\Dorcas\\Aug Project\\Output\\C Partellus")
rm(list=ls())
#1. Median Development Time and Development rate
#EGG
rm(list=ls())
#Input values from pbublished paper
Y<-0.015
rho<-0.155
Tmax<-38.92
V<-5.776
temp<-c(18,20,25,30,32,35)  
UTtemp<-temp[temp>=10.5] 
days<-c(14,11,6,5,4,5)              
samples<-c(200,200,200,200,192,200)           

temperature1<-unique(UTtemp) 

for (i in 1:length(temperature1))
{
  
  rT<-Y*(exp(rho*UTtemp)-exp((rho*Tmax)-((Tmax-UTtemp)/V)))
  
  rate<-round(rT,4)
  
  medTime<-trunc((1/rT),0)
  
}

#Preparing Results for Export: This part may be excluded, depending on where the user wants to export the results. We exported our results in text (.txt) format
drtemp<-UTtemp
drdays<-days
drsize<-samples
dRate<-cbind(drtemp,rate)
mTimeUT<-cbind(drtemp,drdays,drsize,medTime)
#Exporting Results
write.table(dRate,"C. Partellus Development Rate Egg.txt",col.names=FALSE,row.names=FALSE, append=TRUE)
write.table(mTimeUT,"C. Partellus Median Development time Egg.txt",col.names=FALSE,row.names=FALSE, append=TRUE)

#Larva
rm(list=ls())
#Input values from pbublished paper
Y<-0.003
rho<-0.17
Tmax<-37.58
V<-5.51
temp<-c(18,20,25,30,32,35)  
UTtemp<-temp[temp>=9.56] 
samples<-c(200,184,165,196,199,195)
days<-c(82,59,33,22,24,28)

temperature1<-unique(UTtemp) 

for (i in 1:length(temperature1))
{
  rT<-Y*(exp(rho*UTtemp)-exp((rho*Tmax)-((Tmax-UTtemp)/V)))
  
  rate<-round(rT,4)
  
  medTime<-trunc((1/rT),0)
  }
#Preparing Results for Export: This part may be excluded, depending on where the user wants to export the results. We exported our results in text (.txt) format
drtemp<-UTtemp
drdays<-days
drsize<-samples
dRate<-cbind(drtemp,rate)
mTimeUT<-cbind(drtemp,drdays,drsize,medTime)
#Exporting Results
write.table(dRate,"C. Partellus Development Rate Larva.txt",col.names=FALSE,row.names=FALSE, append=TRUE)
write.table(mTimeUT,"C. Partellus Median Development time Larva.txt",col.names=FALSE,row.names=FALSE, append=TRUE)

#Pupa
rm(list=ls())
#Input values from pbublished paper
Y<-0.02
rho<-0.17
Tmax<-38.04
V<-5.65
temp<-c(18,20,25,30,32,35)  
UTtemp<-temp[temp>=10.09] 
LTtemp<-temp[temp<=10.09]  
samples<-c(116,103,82,177,163,119)
days<-c(21,17,9,7,7,8)
temperature1<-unique(UTtemp) 

for (i in 1:length(temperature1))
{
  
  rT<-Y*(exp(rho*UTtemp)-exp((rho*Tmax)-((Tmax-UTtemp)/V)))
  
  rate<-round(rT,4)
  
  medTime<-trunc((1/rT),0)
 }
#Preparing Results for Export: This part may be excluded, depending on where the user wants to export the results. We exported our results in text (.txt) format
drtemp<-UTtemp
drdays<-days
drsize<-samples
dRate<-cbind(drtemp,rate)
mTimeUT<-cbind(drtemp,drdays,drsize,medTime)
#Exporting Results
write.table(dRate,"C. Partellus Development Rate Pupa.txt",col.names=FALSE,row.names=FALSE, append=TRUE)
write.table(mTimeUT,"C. Partellus Median Development time Pupa.txt",col.names=FALSE,row.names=FALSE, append=TRUE)


