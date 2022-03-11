#Самостоятельная работа №4/Задание 1


library("tidyverse")
library("lubridate")
#1
gaz <- read.csv(file = "https://raw.githubusercontent.com/qwerty29544/RpracticeBook/master/2Data/01FlatTables/GAZ.csv",
                header = TRUE, 
                dec = ",",
                sep = "\t")

#2
gaz <- na.omit(gaz)
gaz[[1]] <- as.Date(gaz[[1]], "%d/%m/%Y")

#3
gaz$Туст..K <- gaz$Туст..С + 273
gaz <- gaz[, -3]

#4
gaz$ID <- as.numeric(as.character(gaz$ID))
gaz$Куст <- as.character(gaz$Куст)
gaz$Группа <- as.character(gaz$Группа)

#5
gaz$газ_к_конденсату <- gaz$газ.м3.сут/gaz$конд.т.м3.сут
gaz$газ_к_воде <- gaz$газ.м3.сут/gaz$вода.м3.сут
gaz$вода_к_конденсату <- gaz$вода.м3.сут/gaz$конд.т.м3.сут

#6
gaz <- na.omit(gaz)
y_gaz <- gaz[year(gaz$дата.замера) == 2018, ]

#7
y_gaz[(y_gaz$ID == 111), ]

#8
gaz$ID <- as.factor(gaz$ID)
gaz_voda <- !vector("logical", nlevels(gaz$ID))
for(i in c(1:nlevels(gaz$ID)))
{ 
    gaz_1 <- gaz$вода.м3.сут[gaz$ID == levels(gaz$ID)[i]]
    for(g in gaz_1)
    {
        if(g > 2) gaz_voda[i] = FALSE
    }
}
levels(gaz$ID)[gaz_voda]

#9
gaz_dob <- !vector("logical", nlevels(gaz$ID))
for(i in c(1:nlevels(gaz$ID)))
{ 
    gaz_1 <- gaz$вода.м3.сут[gaz$ID == levels(gaz$ID)[i]] +
        gaz$газ.м3.сут[gaz$ID == levels(gaz$ID)[i]] +
        gaz$конд.т.м3.сут[gaz$ID == levels(gaz$ID)[i]]
    for(g in gaz_1)
    {
        if(g < 1000) gaz_dob[i] = FALSE
    }
}

levels(gaz$ID)[gaz_dob]

#10
gaz$Куст <- as.factor(gaz$Куст)
gaz$Группа <- as.factor(gaz$Группа)
y_gaz <- gaz[year(gaz$дата.замера) == 2018, ]
gaz_res <- vector("double", nlevels(y_gaz$Группа))
names(gaz_res) <- levels(y_gaz$Группа)

for(i in c(1:nlevels(y_gaz$Группа)))
{
    gaz_res[i] <- sum(y_gaz$газ.м3.сут[y_gaz$Группа == 
                                           levels(y_gaz$Группа)[i]])
}

names(gaz_res[gaz_res == max(gaz_res)])

#11
gaz_v_r <- vector("double", nlevels(y_gaz$Куст))
names(gaz_v_r) <- levels(y_gaz$Куст)

for(i in c(1:nlevels(y_gaz$Куст)))
{
    gaz_v_r[i] <- sum(y_gaz$вода.м3.сут[y_gaz$Куст == 
                                            levels(y_gaz$Куст)[i]])
}
names(gaz_v_r[gaz_v_r == max(gaz_v_r)])

#12
gaz <- gaz[gaz$газ_к_воде != Inf, ]
gaz_gaz <- vector("double", nlevels(gaz$Куст))
names(gaz_gaz) <- levels(gaz$Куст)

for(i in c(1:nlevels(gaz$Куст)))
{
    gaz_gaz[i] <- mean(gaz$газ_к_воде[gaz$Куст == 
                                          levels(gaz$Куст)[i]])
}
names(gaz_gaz[gaz_gaz == max(gaz_gaz)])

