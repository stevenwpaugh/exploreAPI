\name{getPCGPdata}
\alias{getPCGPdata}
\title{
Retrieve data from the PCGP
}
\description{
This function will retrieve a variety of data from the PCGP data dashboard.
}


\arguments{
\item{sample}{Vector of sample(s) names that you wish to retrieve data for.  Leave blank for all samples}
\item{datatype}{Datatype you wish to retrieve. Options are "sv", "cnv", "snv_indel"}
}



\author{
Steven W. Paugh \email{steven.paugh@stjude.org}
}

\examples{
getPCGPdata("SJTALL001", datatype="sv")
getPCGPdata("SJTALL001", datatype="cnv")
getPCGPdata("SJTALL001", datatype="snv_indel")

getPCGPdata(datatype="sv")
}


\keyword{sv, cnv, snv, indel}

