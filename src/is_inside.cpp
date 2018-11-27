#include <math.h>
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
LogicalVector is_inside(NumericMatrix points) {

    LogicalVector inside(points.nrow());

    // for loop in which `inside` is defined
    for(int i(0); i<points.nrow(); i++){

           double x0 = points(i,0);
           double y0 = points(i,1);

           if(std::sqrt(x0*x0+y0*y0) <= 1){
               inside[i] = true; } else {
                   inside[i] = false;
               }
    }

    return inside;
}

