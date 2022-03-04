
# 1 -----------------------------------------------------------------------


if ("car" %in% installed.packages() == FALSE) {
    install.packages("car")
}

library(car)

Firms <- Ornstein

# 2 -----------------------------------------------------------------------



dim(Firms)

# 3 -----------------------------------------------------------------------


sum(is.na.data.frame(Firms))


# 4 -----------------------------------------------------------------------


# 5 -----------------------------------------------------------------------

hist(Firms$assets, breaks = 40)

plot(log(Firms$assets), 
     type = "o", 
     pch = 19, 
     cex = I(0.5), 
     col = "blue")

Firms



library(openxlsx)

openxlsx::read.xlsx()


