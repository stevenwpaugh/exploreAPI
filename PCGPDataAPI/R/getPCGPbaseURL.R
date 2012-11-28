getPCGPbaseURL <- function(){
return ("http://explore.pediatriccancergenomeproject.org/")
if (exists("dev.test")){
return ("http://pcgpdtportaldev01.stjude.org/")
}
}


