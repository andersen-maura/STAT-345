generate_data<-function(n,p){
  covariates<-matrix(rnorm(n*p),n)
  responses<-rnorm(n)
  output<-list(covariates,responses);names(output)<-c("Covariates","Responses")
  return(output)
}
blah<-generate_data(1000,100)

model_select<-function(covariates, responses, cutoff){
blob<-lm(responses~covariates)
p<-summary(blob)$coefficients[,4] 
index<-which(p<cutoff)
blob<-lm(responses~covariates[,index])
pvals<-summary(blob)$coefficients[,4] 
return(pvals)
}
pvals<-model_select(blah$Covariates,blah$Responses,0.05)