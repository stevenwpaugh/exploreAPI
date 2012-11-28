getPCGPdata("SJTALL001", datatype="cnv")
getPCGPdata("SJTALL001", datatype="sv")
getPCGPdata("SJTALL001", datatype="snv_indel")

#Here we specify "all" as the sample name to return all data
allsvdata <- getPCGPdata("all", datatype="sv")

dim (allsvdata)

#Here we don't specify a sample name to return all data
allsvdata2 <- getPCGPdata(datatype="sv")

dim (allsvdata2)