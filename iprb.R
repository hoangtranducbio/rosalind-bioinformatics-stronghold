x <- as.numeric(strsplit(trimws(readLines("E:/rosalind_iprb.txt")[1]), " ")[[1]])
k <- x[1]; m <- x[2]; n <- x[3]
N <- k + m + n

p_rec <- (n/N) * ((n-1)/(N-1)) * 1 +
         (m/N) * ((m-1)/(N-1)) * 0.25 +
         2 * (m/N) * (n/(N-1)) * 0.5

p_dom <- 1 - p_rec

cat(sprintf("%.5f", p_dom), "\n", sep = "")
writeClipboard(sprintf("%.5f", p_dom)) 