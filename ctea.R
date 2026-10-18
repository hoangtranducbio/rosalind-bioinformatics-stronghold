parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

seqs <- unname(parse_fasta(readLines("E:/rosalind_ctea.txt")))
a <- strsplit(seqs[1], "")[[1]]
b <- strsplit(seqs[2], "")[[1]]
n <- length(a)
m <- length(b)

MOD <- 134217727


D <- matrix(0L, nrow = n + 1, ncol = m + 1)
D[, 1] <- 0:n
D[1, ] <- 0:m

C <- matrix(0, nrow = n + 1, ncol = m + 1)
C[, 1] <- 1
C[1, ] <- 1

for (i in seq_len(n)) {
  for (j in seq_len(m)) {
    cost <- if (a[i] == b[j]) 0L else 1L
    
    diag <- D[i, j] + cost          
    up   <- D[i, j + 1] + 1L        
    left <- D[i + 1, j] + 1L       
    d    <- min(diag, up, left)
    D[i + 1, j + 1] <- d
    
    total <- 0
    if (diag == d) total <- total + C[i, j]
    if (up   == d) total <- total + C[i, j + 1]
    if (left == d) total <- total + C[i + 1, j]
    C[i + 1, j + 1] <- total %% MOD
  }
}

writeLines(sprintf("%.0f", C[n + 1, m + 1]), "E:/rosalind_ctea_output.txt")