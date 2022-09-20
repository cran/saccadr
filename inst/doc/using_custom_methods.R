## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
#  custom_saccade_voting_method <- function(x,
#                                           y,
#                                           vel,
#                                           acc,
#                                           sample_rate,
#                                           trial,
#                                           options) {
#  
#    # implement you method that computes a 0/1 vote per sample
#  
#    sample_votes
#  }

## ----eval = FALSE-------------------------------------------------------------
#  simple_threshold_method <- function(x,
#                                      y,
#                                      vel,
#                                      acc,
#                                      sample_rate,
#                                      trial,
#                                      options) {
#  
#    # obtain method parameters or use defaults
#    velocity_threshold <- saccadr::option_or_default(options, "st_velocity_threshold", 50)
#  
#    # vote on each sample
#    sample_vote <- vel[['amp']] > velocity_threshold
#  
#    # return votes
#    sample_vote
#  }

## ----eval=FALSE---------------------------------------------------------------
#  data("single_trial")
#  saccades <- saccadr::extract_saccades(x = single_trial$x,
#                                        y = single_trial$y,
#                                        sample_rate = 500,
#                                        methods = list("ek", "om", "nh", simple_threshold_method),
#                                        options = list("st_velocity_threshold" = 70))

