dir.create("./exploreAPIlibloc", showWarnings = FALSE)
lib.loc <- "./exploreAPIlibloc"

#install.packages("XML", lib=lib.loc)
#install.packages("png", lib=lib.loc)

require ("XML", lib.loc=lib.loc)
require ("png", lib.loc=lib.loc)

install.packages("PCGPDataAPI_0.4.tar.gz", repos=NULL, type="source", lib=lib.loc)

require (PCGPDataAPI, lib.loc=lib.loc)
dev.test <- TRUE

getPCGPbaseURL()
getPCGPsamplelist()

drawPCGPcircos("SJTALL001")

getPCGPdata("SJTALL001", datatype="sv")
getPCGPdata("SJTALL001", datatype="cnv")
getPCGPdata("SJTALL001", datatype="snv_indel")

getPCGPgenedata("EZH2")

head(getPCGPdata(datatype="sv"))
head(getPCGPdata(datatype="snv_indel"))
head(getPCGPdata(datatype="cnv"))

head(getPCGPdata("SJTALL002", datatype="cnv"))



