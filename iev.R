counts = as.numeric(strsplit(trimws(readLines("E:/rosalind_iev.txt")[1]), " ")[[1]])
p <- c(1, 1, 1, 0.75, 0.5, 0)
result = 2* sum(counts * p)
cat(result)