lines <- trimws(readLines("E:/rosalind_lgis.txt"))
lines <- lines[lines != ""]
n <- as.integer(lines[1])
p <- as.integer(strsplit(lines[2], " ")[[1]])

lis <- function(a) {
  len  <- rep(1L, length(a))      
  prev <- rep(0L, length(a))      
  
  for (i in seq_along(a)) {
    if (i > 1) {
      j <- which(a[1:(i - 1)] < a[i])         
      if (length(j) > 0) {
        best    <- j[which.max(len[j])]        
        len[i]  <- len[best] + 1L
        prev[i] <- best
      }
    }
  }
  
  i <- which.max(len)             
  res <- integer(0)
  while (i != 0) {                
    res <- c(a[i], res)           
    i <- prev[i]
  }
  res
}

inc <- lis(p)
dec <- -lis(-p)

out <- c(paste(inc, collapse = " "), paste(dec, collapse = " "))
writeLines(out, "E:/rosalind_lgis_output.txt")