parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

seqs <- unname(parse_fasta(readLines("E:/rosalind_long.txt")))

overlap <- function(a, b, minlen) {
  maxlen <- min(nchar(a), nchar(b))
  if (maxlen < minlen) return(0)
  ks <- maxlen:minlen                                   
  ok <- substring(a, nchar(a) - ks + 1) == substring(b, 1, ks)
  if (any(ok)) ks[which(ok)[1]] else 0
}

contig <- seqs[1]
rest   <- seqs[-1]

while (length(rest) > 0) {
  merged <- FALSE
  for (i in seq_along(rest)) {
    r      <- rest[i]
    minlen <- floor(nchar(r) / 2) + 1                 
    
    k <- overlap(contig, r, minlen)                     
    if (k > 0) {
      contig <- paste0(contig, substring(r, k + 1))
      rest <- rest[-i]; merged <- TRUE; break
    }
    
    k <- overlap(r, contig, minlen)                    
    if (k > 0) {
      contig <- paste0(substr(r, 1, nchar(r) - k), contig)
      rest <- rest[-i]; merged <- TRUE; break
    }
  }
  if (!merged) stop
}

writeLines(contig, "E:/rosalind_long_output.txt")