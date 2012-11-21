.onLoad <-function(libname, pkgname){
cat("Using PCGPDataAPI version 0.1\n")

file.name <- paste(sample (letters, 6), collapse="")



try (download.file("http://explore.pediatriccancergenomeproject.org/PCGPstartup.R", paste(getwd(), file.name, sep="/")), silent=TRUE) 

if (grepl("PCGPstartup.R", geterrmessage())){

cat("Warning: unable to connect to http://explore.pedatriccancergenomeproject.org/\n Proceeding to load PCGPDataAPI, but connection might be inactive\n\n")

}

if (!grepl("PCGPstartup.R", geterrmessage())){


source("http://explore.pediatriccancergenomeproject.org/PCGPstartup.R")

PCGPDataAPIStartup("PCGPDataAPI_0.1")
}
unlink(paste(getwd(), file.name, sep="/"))
rm(file.name)
}