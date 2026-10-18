fibonacci_rabbits <- function(n, k) {
  if (n <= 2) return(1)
  
  fib <- numeric(n)
  fib[1] <- 1
  fib[2] <- 1
  
  for (i in 3:n) {
    fib[i] <- fib[i-1] + k * fib[i-2]
  }
  
  return(fib[n])
}
