.onLoad <-function(libname, pkgname){
  packageStartupMessage("Using PCGPDataAPI version 0.4\n")
  file.name <- paste(sample (letters, 6), collapse="")
  try (download.file("http://explore.pediatriccancergenomeproject.org/PCGPstartup.R", paste(getwd(), file.name, sep="/")), silent=TRUE) 
  if (grepl("PCGPstartup.R", geterrmessage())){
    packageStartupMessage("Warning: unable to connect to http://explore.pedatriccancergenomeproject.org/\n Proceeding to load PCGPDataAPI, but connection might be inactive\n\n")
  }
  if (!grepl("PCGPstartup.R", geterrmessage())){
    source("http://explore.pediatriccancergenomeproject.org/PCGPstartup.R")
    PCGPDataAPIStartup("PCGPDataAPI_0.4")
  }
  unlink(paste(getwd(), file.name, sep="/"))
  rm(file.name)
}
