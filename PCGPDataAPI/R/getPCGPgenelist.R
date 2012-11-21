getPCGPgenelist <- function(){

PCGPbaseURL <- .getPCGPbaseURL()
genes <- readHTMLTable(

paste(PCGPbaseURL, paste("gene/showgene/genesymbol?email=", .PCGPemail, collapse="", sep=""),  sep=""),
stringsAsFactors=FALSE, as.is=TRUE

)
n.rows <- unlist(lapply(genes, function(t) dim(t)[1]))
genes <- genes[[which.max(n.rows)]]

colnames (genes) <- gsub ("\t", "", colnames(genes))
colnames (genes) <- gsub ("\n", "", colnames(genes))

genes <- genes[,c("Gene Symbol")]
return (genes)
}
