drawPCGPcircos  <- function(x){
.getPCGPemail()
PCGPsamplelist <- getPCGPsamplelist()

if (missing(x)){
cat ("Please specify which sample's circos plot you wish to draw\n")
}

if (!missing(x)){
samples <- intersect (x, PCGPsamplelist[,"Patient"])

if (length (samples) == 0){
cat ("No valid sample name provided\n")
}
if (length (samples) > 1){
cat ("Please specify a single sample\n")
}

if (length (samples) == 1){
x <- samples
file.name <- paste(sample (letters, 6), collapse="")
download.file(paste(.getPCGPbaseURL(), "/patient/", x, "/circos-plot/medium.png?email=", .PCGPemail, sep=""), paste(getwd(), "/", file.name, ".png", sep=""), mode="wb", quiet=TRUE)
img <- readPNG(paste(getwd(), "/", file.name, ".png", sep=""), TRUE)

plot(1:2, type="n", axes=FALSE, xlab="", ylab="", asp=1)
rasterImage(img, 1, 1, 2, 2)
unlink(paste(getwd(), "/", file.name, ".png", sep=""))

}

}
}