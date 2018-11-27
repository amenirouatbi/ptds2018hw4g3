
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
LogicalVector is_inside(NumericMatrix points) {

    LogicalVector inside(points.nrow());

    // for loop in which `inside` is defined

    return inside;
}


// [[Rcpp::export]]
NumericVector timesTwo(NumericVector x) {
  return x * 2;
}



/*** R
timesTwo(42)
*/
