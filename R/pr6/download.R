
# download ----------------------------------------------------------------

ECG <- read.csv(file = "https://raw.githubusercontent.com/qwerty29544/RpracticeBook/master/2Data/01FlatTables/ECG_yurchenkov.txt",
                header = TRUE,
                skip = 46,
                dec = ",",
                sep = "\t",
                encoding = "cp1251")

download.file(url = "https://raw.githubusercontent.com/qwerty29544/RpracticeBook/master/2Data/01FlatTables/ECG_yurchenkov.txt", 
              destfile = "./R/pr6/ecg.txt")


# where is NA -------------------------------------------------------------

mask <- is.na.data.frame(ECG)

which(apply(mask, 1, sum) == 5)


ECG <- read.csv(file = "R/pr6/ecg.txt",
                header = TRUE,
                skip = 46,
                dec = ",",
                sep = "\t",
                encoding = "cp1251")

mask <- is.na.data.frame(ECG)
which(apply(mask, 1, sum) == 5)
subset_ecg = ECG[3840:33950, ]


library(ggplot2)



plot(x = subset_ecg$Время.мс., y = subset_ecg$X4, type = "o", pch = 19, cex = I(0.5))
abline(v = (0:40) * (4000), col = "red")



# fft0 <- function(z, inverse=FALSE) {
#     n <- length(z)
#     if(n == 0) return(z)
#     k <- 0:(n-1)
#     ff <- (if(inverse) 1 else -1) * 2*pi * 1i * k/n
#     vapply(1:n, function(h) sum(z * exp(ff*(h-1))), complex(1))
# }
# 
# fft_abdom <- fft0(z = subset_ecg$X4)
# 
# plot(abs(fft_abdom), type = "o", pch = 19, cex = I(0.5), xlim = c(0, 100))
# abline(v = 30, col = "red")


acf(x = subset_ecg$X4, lag.max = 2000)
