## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo = FALSE, warning = FALSE, message = FALSE--------------------
library(dplyr)
library(ggplot2)
library(saccadr)

## ----warning=FALSE, fig.fullwidth=TRUE, out.width="100%", fig.dim = c(8, 4)----
# computing velocity using two methods
vel_ek <- saccadr::diff_ek(x = single_trial$x,
                           y = single_trial$y,
                           trial = rep(1, nrow(single_trial)),
                           sample_rate = 500)
vel_nh <- saccadr::diff_nh(x = single_trial$x,
                           y = single_trial$y,
                           trial = rep(1, nrow(single_trial)),
                           sample_rate = 500)
vel_comparison <- na.omit(data.frame(EK = vel_ek[['amp']], NH = vel_nh[['amp']])) %>%
  dplyr::filter(NH > 0) %>% # values can be negative due to filtering
  dplyr::mutate(logEK = log(EK), logNH = log(NH)) 

# plotting amplitude comparison
pearson_rho <- cor(vel_comparison[['EK']], vel_comparison[['NH']])

ggplot(data = vel_comparison, aes(x = EK, y = NH)) +
  geom_abline() +
  geom_point() +
  scale_x_log10() +
  scale_y_log10() +
  labs(subtitle = sprintf("Pearson's ρ = %.2f\nPearson's ρ for log transformed velocities = %.2f", pearson_rho, cor(vel_comparison[['logEK']], vel_comparison[['logNH']])),
       x = "Vek",
       y = "Vnh")

# plotting 
ggplot(data = NULL, aes(x = vel_comparison[['EK']] - vel_comparison[['NH']])) +
  geom_histogram(bins = 50) +
  xlab("Vek - Vnh") +
  labs(title = "Difference in velocities computed via two methods")

## ----eval = FALSE-------------------------------------------------------------
#  diff_custom <- function(x, y,  trial, sample_rate, options=NULL) {
#    # compute vertical and horizontal components
#    df <- data.frame(x = ..., # differentiate values of x
#                     y = ...) # differentiate values of y
#  
#    # compute amplitude
#    df[['amp']] = sqrt(df[['x']]^2 + df[['y']]^2))
#  
#    # return a data.frame with columns x, y, and amp
#    return(df)
#  }

## ----eval = FALSE-------------------------------------------------------------
#  library(dplyr)
#  
#  diff_custom <- function(x, y,  trial, sample_rate, options=NULL) {
#    # computing frame time step
#    delta_t_s <- 1 / sample_rate
#  
#    # --- differentiate (compute velocity or acceleration) and filter
#    data.frame(trial = trial,
#               x = x,
#               y = y) %>%
#  
#      # compute velocity and acceleration for each trial
#      group_by(trial) %>%
#      mutate(x = (x - lag(x)) / delta_t_s,
#             y = (y - lag(y)) / delta_t_s,
#             amp = sqrt(x^2 + y^2))
#  }

## ----eval = FALSE-------------------------------------------------------------
#  diff_lag_n <- function(x, y,  trial, sample_rate, options=NULL) {
#    # obtain lag or use default
#    lag_n <- saccadr::option_or_default(options, "custom_velocity_lag", 1)
#  
#    # computing frame time step
#    delta_t_s <- 1 / sample_rate
#  
#    # --- differentiate (compute velocity or acceleration) and filter
#    data.frame(trial = trial,
#               x = x,
#               y = y) %>%
#  
#      # compute velocity and acceleration for each trial
#      group_by(trial) %>%
#      mutate(x = (x - lag(x, lag_n)) / delta_t_s,
#             y = (y - lag(y, lag_n)) / delta_t_s,
#             amp = sqrt(x^2 + y^2))
#  }

