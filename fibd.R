install.packages("gmp")
library(gmp)
mortal_fib = function(n, m, k) {
  ages = rep(as.bigz(0), m)
  ages[1] = as.bigz(1)
  for (i in 2:n){
    new_born = k*sum(ages[2:m])
    ages[2:m] = ages[1:(m-1)]
    ages[1] = new_born
  }
  return(sum(ages))
}