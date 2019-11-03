
#Dorcas Kareithi
#Insect Life Table Reconstrustion Code- MMortality (gives numbers that developed per day)
#An algorithm that reconstructs the insect life tables based on pulished literature.

################################################################################################################
################################################################################################################
#2. Mortality (gives numbers that developed per day)

#EGG
rm(list=ls())
#Input values from pbublished paper
b1<-7.582
b2<--0.666
b3<-0.013
temp<-c(18,20,25,30,32,35)
samples<-c(200,200,200,200,192,200)
days<-c(14,11,6,4,5,5)
in.day<-c(4,4,4,4,4,4)
fdays<-c(12,11,10,7,7,5)
fno<-c(56,46,43,99,73,27)
#Prep
mt<-exp(b1+(b2*temp)+(b3*(temp*temp)))
mt[mt>=1]=1
mort<-mt

temperature<-unique(temp)

for (i in 1:length(temperature))
{
   total_dev<-round((1-mort[i])*samples[i],0)
   set.seed(879)
   distr<-runif(days[i],0,samples[i])
   dsurv1<-distr/sum(distr)
   ddev<-round(((total_dev/sum(dsurv1))*dsurv1),0)
   cumm_dev<-cumsum(ddev)
   #Preparing the data for export
   temps<-rep(temperature[i],length(cumm_dev))
   ldays<-c(in.day[i]:(in.day[i]+length(cumm_dev)-1))
   ssize<-rep(samples[i],length(cumm_dev))
   #Exporting results
   morts<-as.data.frame(cbind(temps, ldays, ssize, ddev))
   write.table(morts,"C. Partellus Egg.txt",col.names=FALSE,row.names=FALSE, append=TRUE)
}

#Larva
#Input values from pbublished paper
rm(list=ls())
b1<-6.27
b2<--0.59
b3<-0.01
temp<-c(18,20,25,30,32,35)
samples<-c(200,184,165,196,199,195)
days<-c(82,59,33,22,24,28)
in.day<-c(18,15,10,8,9,9)
#Prep
mt<-exp(b1+(b2*temp)+(b3*(temp*temp)))
mt[mt>=1]=1
mort<-mt

temperature<-unique(temp)
for (i in 1:length(temperature))
{
   total_dev<-round((1-mort[i])*samples[i],0)
   set.seed(879)
   distr<-runif(days[i],0,samples[i])
   dsurv1<-distr/sum(distr)
   ddev<-round(((total_dev/sum(dsurv1))*dsurv1),0)
   cumm_dev<-cumsum(ddev)
   #Rearranging the data
   temps<-rep(temperature[i],length(cumm_dev))
   ldays<-c(in.day[i]:(in.day[i]+length(cumm_dev)-1))
   ssize<-rep(samples[i],length(cumm_dev))
   
   #morts<-as.data.frame(cbind(temps, ldays, ssize, cumm_dev))
   morts<-as.data.frame(cbind(temps, ldays, ssize, ddev))
   write.table(morts,"C. Partellus Larva.txt",col.names=FALSE,row.names=FALSE, append=TRUE)
}

rm(list=ls())
#Pupa
#Input values from pbublished paper
b1<-16.13
b2<--1.54
b3<-0.030
temp<-c(18,20,25,30,32,35)
samples<-c(116,103,82,177,163,119)
days<-c(21,17,9,7,7,8)
in.day<-c(100,74,43,30,33,37)
#Prep
#lday<-days+1
mt<-exp(b1+(b2*temp)+(b3*(temp*temp)))
mt[mt>=1]=1
mort<-mt

temperature<-unique(temp)
for (i in 1:length(temperature))
{
   total_dev<-round((1-mort[i])*samples[i],0)
   set.seed(879)
   distr<-runif(days[i],0,samples[i])
   dsurv1<-distr/sum(distr)
   ddev<-round(((total_dev/sum(dsurv1))*dsurv1),0)
   cumm_dev<-cumsum(ddev)
   #Rearranging the data
   temps<-rep(temperature[i],length(cumm_dev))
   ldays<-c(in.day[i]:(in.day[i]+length(cumm_dev)-1))
   ssize<-rep(samples[i],length(cumm_dev))
   #Exporting results
   morts<-as.data.frame(cbind(temps, ldays, ssize, ddev))
   write.table(morts,"C. Partellus Pupa.txt",col.names=FALSE,row.names=FALSE, append=TRUE)
}



#############################################################################

