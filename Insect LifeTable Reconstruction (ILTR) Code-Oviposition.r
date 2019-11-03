
#Dorcas Kareithi
#Insect Life Table Reconstrustion Code- Reproduction
#An algorithm that reconstructs the insect life tables based on pulished literature.

################################################################################################################
#3. Reproduction (Total Oviposition)
#if values are given input directly
rm(list=ls())
temp<-c(18,20,25,30,32,35)
fdays<-c(12,11,10,7,7,5)
mdays<-c(11,8,10,8,8,6)
fno<-c(56,46,43,99,73,27)
mno<-c(63,39,36,64,84,36)
in.day<-c(121,91,52,37,40,45)

#Estmating Parameters 
one<-c(1,temp[1],(temp[1]^2))
two<-c(1,temp[3],(temp[3]^2))
three<-c(1,temp[6],(temp[6]^2))

LHS<-c(205.7, 375.3,46)
RHS<-rbind(c(one),c(two),c(three))
parms<-solve(RHS,LHS)

#Therefore
b1<-parms[1]
b2<-parms[2]
b3<-parms[3]

ft<-b1+(b2*temp)+(b3*(temp^2))
Tot<-round((ft*fno),0)
fecu<-cbind(temp,fdays,fno,Tot)

#Exporting Results
write.table(fecu,"C Partellus Fecundity.txt",col.names=TRUE,row.names=FALSE, sep="\t")

#USING EXCEL,DISTRIBUTE THE EGGS TO THE FEMALES PER DAY