library(gmp)

lines <- trimws(readLines("E:/rosalind_pmch.txt"))
lines <- lines[lines != ""]
s <- paste(lines[!startsWith(lines, ">")], collapse = "")

chars <- strsplit(s, "")[[1]]
a <- sum(chars == "A")
c_ <- sum(chars == "C")       

result <- factorialZ(a) * factorialZ(c_)

writeLines(as.character(result), "E:/rosalind_pmch_output.txt")