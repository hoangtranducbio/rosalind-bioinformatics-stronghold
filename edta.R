parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

seqs <- unname(parse_fasta(readLines("E:/rosalind_edta.txt")))
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
      D[i + 1, j + 1] <- 1L + min(D[i, j], D[i, j + 1], D[i + 1, j])
    }
  }
}


s_aln <- character(0)
t_aln <- character(0)
i <- n
j <- m

while (i > 0 || j > 0) {
  cur <- D[i + 1, j + 1]
  if (i > 0 && j > 0 && a[i] == b[j] && cur == D[i, j]) {
    s_aln <- c(a[i], s_aln); t_aln <- c(b[j], t_aln)      
    i <- i - 1; j <- j - 1
  } else if (i > 0 && j > 0 && cur == D[i, j] + 1L) {
    s_aln <- c(a[i], s_aln); t_aln <- c(b[j], t_aln)      
    i <- i - 1; j <- j - 1
  } else if (i > 0 && cur == D[i, j + 1] + 1L) {
    s_aln <- c(a[i], s_aln); t_aln <- c("-", t_aln)       
    i <- i - 1
  } else {
    s_aln <- c("-", s_aln); t_aln <- c(b[j], t_aln)       
    j <- j - 1
  }
}

out <- c(D[n + 1, m + 1],
         paste(s_aln, collapse = ""),
         paste(t_aln, collapse = ""))

writeLines(as.character(out), "E:/rosalind_edta_output.txt")