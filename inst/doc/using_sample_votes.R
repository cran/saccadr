## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE, warning=FALSE--------------------------------------
library(ggplot2)
library(saccadr)

## ----out.width="100%", fig.dim = c(8, 4)--------------------------------------
data("single_trial")

methods_to_use <- list("Engbert & Kliegl (2003)" = method_ek,
                       "Otero-Millan et al. (2014)" = method_om,
                       "Nyström and Holmqvist (2010)" = method_nh)

votes <- extract_saccades(x = single_trial$x,
                          y = single_trial$y,
                          sample_rate = 500,
                          methods = methods_to_use,
                          return_votes = TRUE)

single_trial_with_votes <- list()
for(imethod in 1:length(methods_to_use)){
  single_trial_with_votes[[imethod]] <- single_trial
  single_trial_with_votes[[imethod]]$Method <- toupper(names(methods_to_use)[imethod])
  single_trial_with_votes[[imethod]]$IsSaccade <- votes[, imethod]
  single_trial_with_votes[[imethod]]$IsSaccade <- factor(single_trial_with_votes[[imethod]]$IsSaccade == 1,
                                                         levels = c(TRUE, FALSE))
}

ggplot(do.call("rbind", single_trial_with_votes), 
       aes(x = x, y = y, color = IsSaccade)) +
  geom_point() +
  facet_grid(. ~ Method) +
  theme(legend.position = "top")

## ----out.width="100%", fig.dim = c(8, 4)--------------------------------------
votes <- extract_saccades(x = single_trial$x,
                          y = single_trial$y,
                          sample_rate = 500,
                          methods = methods_to_use,
                          velocity_function = diff_nh,
                          return_votes = TRUE)

single_trial_with_votes <- list()
for(imethod in 1:length(methods_to_use)){
  single_trial_with_votes[[imethod]] <- single_trial
  single_trial_with_votes[[imethod]]$Method <- toupper(names(methods_to_use)[imethod])
  single_trial_with_votes[[imethod]]$IsSaccade <- votes[, imethod]
  single_trial_with_votes[[imethod]]$IsSaccade <- factor(single_trial_with_votes[[imethod]]$IsSaccade == 1,
                                                         levels = c(TRUE, FALSE))
}

ggplot(do.call("rbind", single_trial_with_votes), 
       aes(x = x, y = y, color = IsSaccade)) +
  geom_point() +
  facet_grid(. ~ Method) +
  theme(legend.position = "top")

