
# download ----------------------------------------------------------------

ECG <- read.csv(file = "https://raw.githubusercontent.com/qwerty29544/RpracticeBook/master/2Data/01FlatTables/ECG_yurchenkov.txt",
                header = TRUE,
                skip = 46,
                dec = ",",
                sep = "\t",
                encoding = "cp1251")

download.file(url = "https://raw.githubusercontent.com/qwerty29544/RpracticeBook/master/2Data/01FlatTables/ECG_yurchenkov.txt", destfile = "./R/pr6/ecg.txt")


# where is NA -------------------------------------------------------------

mask <- is.na.data.frame(ECG)

which(apply(mask, 1, sum) == 5)

