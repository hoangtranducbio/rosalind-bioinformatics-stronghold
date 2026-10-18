parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

seqs <- unname(parse_fasta(readLines("E:/rosalind_edit.txt")))
a <- strsplit(seqs[1], "")[[1]]
b <- strsplit(seqs[2], "")[[1]]
n <- length(a)
m <- length(b)

D <- matrix(0L, nrow = n + 1, ncol = m + 1)
D[, 1] <- 0:n                    
D[1, ] <- 0:m                   

for (i in seq_len(n)) {
  for (j in seq_len(m)) {
    if (a[i] == b[j]) {
      D[i + 1, j + 1] <- D[i, j]
    } else {
      D[i + 1, j + 1] <- 1L + min(D[i, j],        
                                  D[i, j + 1],    
                                  D[i + 1, j])    
    }
  }
}

writeLines(as.character(D[n + 1, m + 1]), "E:/rosalind_edit_output.txt")