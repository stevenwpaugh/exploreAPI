pcgpinstall <- function(x){
if (x == "PCGPDataAPI"){
download.file(paste("http://explore.pediatriccancergenomeproject.org/PCGPDataAPI_0.4.tar.gz"), paste(getwd(), "PCGPDataAPI_0.4.tar.gz", sep="/"), mode="wb")
install.packages("XML")
install.packages("png")
install.packages(paste(getwd(), "PCGPDataAPI_0.4.tar.gz", sep="/"), repos=NULL, type="source")
unlink(paste(getwd(), "PCGPDataAPI_0.4.tar.gz", sep="/"))
}
if (x != "PCGPDataAPI"){
cat("ERROR: An invalid package name was specified\nPlease try again\nSee http://explore.pediatriccancergenomeproject.org/apis/ for more details.\n")
}
}
