
getPCGPgenedata <- function (genesymbol){
.getPCGPemail()
PCGPbaseURL <- .getPCGPbaseURL()
if (missing(genesymbol)){
cat("Please specify a gene symbol.\n\nExample 1:
getPCGPgenedata(\"EZH2\")
Example 2:
getPCGPgenedata(\"TP53\")
")
}

if (!missing (genesymbol)){

pcgpgenedata <- getPCGPgenelist()

gene <- intersect (genesymbol, pcgpgenedata)

if (length(gene) == 0){
cat("Data not currently available for specified gene, or invalid gene symbol specified.\nUse getPCGPgenelist(), to get a listing of genes with available data.\n")
}

if (length(gene) == 1){

genedata <- readHTMLTable(

paste(PCGPbaseURL, "/gene/", gene, "?email=", .PCGPemail, sep=""),
stringsAsFactors=FALSE, as.is=TRUE
)
n.rows <- unlist(lapply(genedata, function(t) dim(t)[1]))
genedata <- genedata[[which.max(n.rows)]]


colnames (genedata) <- gsub ("\t", "", colnames(genedata))
colnames (genedata) <- gsub ("\n", "", colnames(genedata))

return(genedata)
}

if (length(gene) > 1){

cat("Please specify a single gene symbol.")
}


}



}



