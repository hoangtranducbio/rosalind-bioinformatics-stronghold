parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  ids <- substring(lines[header_idx], 2)
  end_idx <- c(header_idx[-1] - 1, length(lines))
  seqs <- mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
                 header_idx, end_idx)
  names(seqs) <- ids
  seqs
}

seqs <- parse_fasta(readLines("E:/rosalind_grph.txt"))

k <- 3
n <- nchar(seqs)
prefix <- substr(seqs, 1, k)             
suffix <- substr(seqs, n - k + 1, n)     

out <- character(0)
for (i in seq_along(seqs)) {
  for (j in seq_along(seqs)) {
    if (i != j && suffix[i] == prefix[j]) {
      out <- c(out, paste(names(seqs)[i], names(seqs)[j]))
    }
  }
}

cat(out, sep = "\n")
writeClipboard(paste(out, collapse = "\n"))