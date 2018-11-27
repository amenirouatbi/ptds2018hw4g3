#include <math.h>
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
LogicalVector is_inside(NumericMatrix points) {

    LogicalVector inside(points.nrow());

    // for loop in which `inside` is defined
    for(int i(0); i<points.nrow(); i++){

           if((std::sqrt(std::pow(points(i,0),2) + std::pow(points(i,1),2))) <= 1) {
            true; } else {
                false;
        }
    }

    return inside;
}

