

.getPCGPcnv <- function (x){

  datatypeextension <- "cnv"

  PCGPbaseURL <- getPCGPbaseURL()
  PCGPsamplelist <- getPCGPsamplelist()

  if (missing(x)){
    stop ("You must supply a sample name", call.=FALSE)
                                        #return("")
                                        #samples <- unlist(PCGPsamplelist[,"Patient"])
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
    cnv <- read.csv(
             paste(PCGPbaseURL, "patient/", datatypeextension, ".csv?l2r=true&t=&a=HG19&r=&p=", paste(samples, collapse=","), sep=""), stringsAsFactors=FALSE, as.is=TRUE, row.names=NULL
             )
                                        #n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
                                        #cnv <- tables[[which.max(n.rows)]]

    colnames (cnv) <- gsub ("\n", "", colnames (cnv))
    colnames (cnv) <- gsub ("\t", "", colnames (cnv))

    
    return(cnv)
  }
  if (length (samples) == 0){
    cat ("No valid sample name provided\n")
  }
  
}
