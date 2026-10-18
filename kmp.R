parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

s <- strsplit(unname(parse_fasta(readLines("E:/rosalind_kmp.txt")))[1], "")[[1]]
n <- length(s)

P <- integer(n)         
k <- 0

for (i in seq_len(n - 1) + 1) {                 
  while (k > 0 && s[k + 1] != s[i]) {
    k <- P[k]                                  
  }
  if (s[k + 1] == s[i]) {
    k <- k + 1                                 
  }
  P[i] <- k
}

writeLines(paste(P, collapse = " "), "E:/rosalind_kmp_output.txt")