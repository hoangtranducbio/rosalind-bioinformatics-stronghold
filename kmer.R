parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

s <- unname(parse_fasta(readLines("E:/rosalind_kmer.txt")))[1]
k <- 4
n <- nchar(s)


kmers <- substring(s, 1:(n - k + 1), k:n)


bases <- c("A", "C", "G", "T")
grid  <- expand.grid(b4 = bases, b3 = bases, b2 = bases, b1 = bases,
                     stringsAsFactors = FALSE)
all_kmers <- paste0(grid$b1, grid$b2, grid$b3, grid$b4)


counts <- table(factor(kmers, levels = all_kmers))

writeLines(paste(as.integer(counts), collapse = " "), "E:/rosalind_kmer_output.txt")