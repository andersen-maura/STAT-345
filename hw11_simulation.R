generate_data<-function(n,p){
  covariates<-matrix(rnorm(n*p),n)
  responses<-rnorm(n)
  output<-list(covariates,responses);names(output)<-c("Covariates","Responses")
  return(output)
}
blah<-generate_data(1000,100)