parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

seqs <- unname(parse_fasta(readLines("E:/rosalind_lcsq.txt")))
a <- strsplit(seqs[1], "")[[1]]
b <- strsplit(seqs[2], "")[[1]]
n <- length(a)
m <- length(b)


L <- matrix(0L, nrow = n + 1, ncol = m + 1)

for (i in seq_len(n)) {
  for (j in seq_len(m)) {
    if (a[i] == b[j]) {
      L[i + 1, j + 1] <- L[i, j] + 1L
    } else {
      L[i + 1, j + 1] <- max(L[i, j + 1], L[i + 1, j])
    }
  }
}


res <- character(0)
i <- n
j <- m
while (i > 0 && j > 0) {
  if (a[i] == b[j]) {
    res <- c(a[i], res)         
    i <- i - 1
    j <- j - 1
  } else if (L[i, j + 1] >= L[i + 1, j]) {
    i <- i - 1                 
  } else {
    j <- j - 1                 
  }
}

writeLines(paste(res, collapse = ""), "E:/rosalind_lcsq_output.txt")