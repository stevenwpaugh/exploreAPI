getPCGPsamplelist <- function(){
.getPCGPemail()
PCGPbaseURL <- .getPCGPbaseURL()
patients <- readHTMLTable(

paste(PCGPbaseURL, paste("allPatients?email=", .PCGPemail, collapse="", sep=""),  sep=""),
stringsAsFactors=FALSE, as.is=TRUE

)
n.rows <- unlist(lapply(patients, function(t) dim(t)[1]))
patients <- patients[[which.max(n.rows)]]

colnames (patients) <- gsub ("\t", "", colnames(patients))
colnames (patients) <- gsub ("\n", "", colnames(patients))
#patients <- subset (patients, patients$Cohort == "WGS")
patients <- patients[,c("Patient", "Disease")]
return (patients)
}


