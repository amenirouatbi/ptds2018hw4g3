
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
LogicalVector is_inside(NumericMatrix points) {

    LogicalVector inside(points.nrow());

    // for loop in which `inside` is defined
    for(int i(1); i<=points.nrow(); i++){
        if((sqrt(pow(points[i,1],2) + pow(points[i,2],2))) <= 1){
            TRUE; } else {
                FALSE;
        }
    }

    return inside;
}


// [[Rcpp::export]]
NumericVector timesTwo(NumericVector x) {
  return x * 2;
}



/*** R
timesTwo(42)
*/
