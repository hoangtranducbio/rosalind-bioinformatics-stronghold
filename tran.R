parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

seqs <- unname(parse_fasta(readLines("E:/rosalind_tran.txt")))
a <- strsplit(seqs[1], "")[[1]]
b <- strsplit(seqs[2], "")[[1]]

mism <- a != b                          # TRUE tại vị trí khác nhau
pair <- paste0(a[mism], b[mism])        # ví dụ "AG", "CT", "AC", ...

transitions   <- sum(pair %in% c("AG", "GA", "CT", "TC"))
transversions <- length(pair) - transitions

ratio <- transitions / transversions