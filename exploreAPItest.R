lib.loc <- "~/exploreAPIlibloc"

#install.packages("XML", lib=lib.loc)
#install.packages("png", lib=lib.loc)

require ("XML", lib.loc=lib.loc)
require ("png", lib.loc=lib.loc)

install.packages("PCGPDataAPI_0.3.tar.gz", repos=NULL, type="source", lib=lib.loc)

require (PCGPDataAPI, lib.loc=lib.loc)
dev.test <- TRUE

getPCGPsamplelist()


patients <- readHTMLTable(

paste(PCGPbaseURL, paste("allPatients", collapse="", sep=""),  sep=""),
stringsAsFactors=FALSE, as.is=TRUE

)
