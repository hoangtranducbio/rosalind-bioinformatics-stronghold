parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

seqs <- unname(parse_fasta(readLines("E:/rosalind_lcsm.txt")))

ord      <- order(nchar(seqs))
shortest <- seqs[ord[1]]
others   <- seqs[ord[-1]]
n        <- nchar(shortest)

in_all <- function(sub) {
  all(vapply(others, function(o) grepl(sub, o, fixed = TRUE), logical(1)))
}

best <- ""
for (L in 1:n) {
  cands <- unique(substring(shortest, 1:(n - L + 1), L:n))  
  cands <- cands[vapply(cands, in_all, logical(1))]        
  if (length(cands) == 0) break
  best <- cands[1]
}

cat(best, "\n", sep = "")
writeClipboard(best)