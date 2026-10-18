library(gmp)

lines <- trimws(readLines("E:/rosalind_mmch.txt"))
lines <- lines[lines != ""]
s <- paste(lines[!startsWith(lines, ">")], collapse = "")

chars <- strsplit(s, "")[[1]]
a  <- sum(chars == "A")
u  <- sum(chars == "U")
c_ <- sum(chars == "C")     
g  <- sum(chars == "G")

perm <- function(x, y) {
  big <- max(x, y); small <- min(x, y)
  result <- as.bigz(1)
  for (k in seq_len(small)) result <- result * (big - k + 1)
  result
}

writeLines(as.character(perm(a, u) * perm(c_, g)), "E:/rosalind_mmch_output.txt")