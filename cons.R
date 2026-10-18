parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

seqs <- unname(parse_fasta(readLines("E:/rosalind_cons.txt")))

m <- do.call(rbind, strsplit(seqs, ""))

bases   <- c("A", "C", "G", "T")
profile <- sapply(bases, function(b) colSums(m == b))   
profile <- t(profile)                                    

consensus <- paste(bases[apply(profile, 2, which.max)], collapse = "")

out <- c(consensus,
         paste0(bases, ": ", apply(profile, 1, paste, collapse = " ")))

cat(out, sep = "\n")
writeClipboard(paste(out, collapse = "\n"))