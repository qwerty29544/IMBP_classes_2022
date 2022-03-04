if ("dplyr" %in% installed.packages() == FALSE) {
    install.packages("dplyr")
}


library(car)

library(magrittr)

print(sum(1:26))


(1:26) %>% 
    sum() %>% 
    print()


# Пайплайны из dplyr ------------------------------------------------------
library(dplyr)

mtcars %>% 
    dplyr::filter(disp == 160 | gear > 3)



# Агрегация ---------------------------------------------------------------


mtcars %>% 
    group_by(gear) %>% 
    summarise(mean_disp = mean(disp), 
              sd_disp = sd(disp), 
              median_disp = median(disp))



# -------------------------------------------------------------------------

mtcars %>% 
    dplyr::arrange(desc(gear), carb)






