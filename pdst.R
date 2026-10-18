parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

seqs <- unname(parse_fasta(readLines("E:/rosalind_pdst.txt")))
m <- do.call(rbind, strsplit(seqs, ""))      # ma trận n x L, mỗi hàng một chuỗi
n <- nrow(m)
L <- ncol(m)

D <- matrix(0, nrow = n, ncol = n)
for (i in seq_len(n)) {
  for (j in seq_len(n)) {
    D[i, j] <- sum(m[i, ] != m[j, ]) / L
  }
}

out <- apply(D, 1, function(r) paste(sprintf("%.5f", r), collapse = " "))
writeLines(out, "E:/rosalind_pdst_output.txt")