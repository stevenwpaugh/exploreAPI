

.getPCGPcnv <- function (x){

datatypeextension <- "cnv"

PCGPbaseURL <- getPCGPbaseURL()
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

paste(PCGPbaseURL, "patient/", datatypeextension, "?r=&p=", paste(samples, collapse=","), sep=""), stringsAsFactors=FALSE, as.is=TRUE

)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
cnv <- tables[[which.max(n.rows)]]

colnames (cnv) <- gsub ("\n", "", colnames (cnv))
colnames (cnv) <- gsub ("\t", "", colnames (cnv))


return(cnv)
}
if (length (samples) == 0){
cat ("No valid sample name provided\n")
}

}
