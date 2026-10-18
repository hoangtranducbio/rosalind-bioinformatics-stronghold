lines <- trimws(readLines("E:/rosalind_lexv.txt"))
lines <- lines[lines != ""]

alphabet <- strsplit(lines[1], " ")[[1]]
n <- as.integer(lines[2])

gen <- function(prefix) {
  if (nchar(prefix) == n) return(character(0))
  unlist(lapply(alphabet, function(a) {
    s <- paste0(prefix, a)
    c(s, gen(s))
  }))
}

result <- gen("")

writeClipboard(paste(result, collapse = "\n"))