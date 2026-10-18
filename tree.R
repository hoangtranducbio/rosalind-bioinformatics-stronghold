lines <- trimws(readLines("E:/rosalind_tree.txt"))
lines <- lines[lines != ""]

n <- as.integer(lines[1])
m <- length(lines) - 1         

result <- (n - 1) - m