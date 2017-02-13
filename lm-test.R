library(cpr)
library(dplyr)
library(lme4)

lm_data <-
  data_frame(x = seq(0, 10, length = 10000),
             y = sin(x) + rnorm(10000))

lmer_data <-
  replicate(100,{
            b <- rnorm(1, sd = 3)
            data_frame(x = c(0, 10, runif(98, 0, 10)),
                       y = sin(x) + b + rnorm(100))
             },
            simplify = FALSE) %>%
  bind_rows(.id = "id")
  
system.time(cpr(cp(y ~ bsplines(x, df = 104), data = lm_data)))
system.time(cpr(cp(y ~ bsplines(x, df = 104) + (1|id), data = lm_data, method = lmer)))



