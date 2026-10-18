lines <- trimws(readLines("E:/rosalind_rstr.txt"))
lines <- lines[lines != ""]

first <- strsplit(lines[1], " ")[[1]]
N <- as.numeric(first[1])
x <- as.numeric(first[2])
s <- lines[2]

chars <- strsplit(s, "")[[1]]
n_gc  <- sum(chars %in% c("G", "C"))
n_at  <- length(chars) - n_gc

p <- (x / 2)^n_gc * ((1 - x) / 2)^n_at

result <- -expm1(N * log1p(-p))

cat(sprintf("%.3f", result))