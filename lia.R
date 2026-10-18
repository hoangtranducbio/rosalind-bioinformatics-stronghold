x <- as.numeric(strsplit(trimws(readLines("E:/rosalind_lia.txt")[1]), " ")[[1]])
k <- x[1]
N <- x[2]

total <- 2^k
p <- 1 - pbinom(N - 1, size = total, prob = 0.25)

cat(sprintf("%.3f", p), "\n", sep = "")
writeClipboard(sprintf("%.3f", p))