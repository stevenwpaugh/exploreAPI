

.getPCGPsnvindel <- function (x){

datatypeextension <- "snv-indel"

PCGPbaseURL <- .getPCGPbaseURL()
PCGPsamplelist <- getPCGPsamplelist()

if (missing(x)){
samples <- unlist(PCGPsamplelist[,"Patient"])
}

if (!missing(x)){
if (x != "all"){
samples <- intersect (x, PCGPsamplelist[,"Patient"])
}

if (x == "all"){
samples <- PCGPsamplelist[,"Patient"]
}

}

if (length (samples) > 0){
tables <- readHTMLTable(

paste(PCGPbaseURL, "patient/", datatypeextension, "?r=&p=", paste(samples, collapse=","), "&email=", .PCGPemail, sep=""), stringsAsFactors=FALSE, as.is=TRUE
 

)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
snv.indel <- tables[[which.max(n.rows)]]

colnames (snv.indel) <- gsub ("\n", "", colnames (snv.indel))
colnames (snv.indel) <- gsub ("\t", "", colnames (snv.indel))


return(snv.indel)
}

if (length (samples) == 0){
cat ("No valid sample name provided\n")
}

}


