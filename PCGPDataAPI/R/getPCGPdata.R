
getPCGPdata <- function (samples, datatype){
if (missing(datatype)){
cat("Please specify a valid datatype, choices are:\n\"sv\"\t\tStructural Variation
\"snv_indel\"\tSingle Nucleotide Variant Insertions Deletions
\"cnv\"\t\tCopy Number Variation\n\n
Example 1:
getPCGPdata(\"STJALL001\", datatype=\"cnv\")
Example 2:
getPCGPdata(\"all\", datatype=\"sv\")
")
}

if (!missing (datatype)){


if (datatype=="sv"){
pcgpdata <- .getPCGPsv(samples)
return(pcgpdata)
}
if (datatype=="snv_indel"){
pcgpdata <- .getPCGPsnvindel(samples)
return(pcgpdata)
}
if (datatype=="cnv"){
pcgpdata <- .getPCGPcnv(samples)
return(pcgpdata)
}


}


}



