// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// compute_velocity_ek
NumericVector compute_velocity_ek(NumericVector x, IntegerVector trial, int time_window_in_samples, float delta_t);
RcppExport SEXP _saccadr_compute_velocity_ek(SEXP xSEXP, SEXP trialSEXP, SEXP time_window_in_samplesSEXP, SEXP delta_tSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type trial(trialSEXP);
    Rcpp::traits::input_parameter< int >::type time_window_in_samples(time_window_in_samplesSEXP);
    Rcpp::traits::input_parameter< float >::type delta_t(delta_tSEXP);
    rcpp_result_gen = Rcpp::wrap(compute_velocity_ek(x, trial, time_window_in_samples, delta_t));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_saccadr_compute_velocity_ek", (DL_FUNC) &_saccadr_compute_velocity_ek, 4},
    {NULL, NULL, 0}
};

RcppExport void R_init_saccadr(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
