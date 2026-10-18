x <- as.numeric(strsplit(trimws(readLines("E:/rosalind_pper.txt")[1]), " ")[[1]])
n <- x[1]
k <- x[2]

result <- 1
for (i in 0:(k - 1)) {
  result <- (result * (n - i)) %% 1000000
}

cat(result, "\n", sep = "")
writeClipboard(as.character(result))