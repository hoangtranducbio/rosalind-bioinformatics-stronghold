parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

revc <- function(s) {
  chartr("ACGT", "TGCA", paste(rev(strsplit(s, "")[[1]]), collapse = ""))
}

reads <- unname(parse_fasta(readLines("E:/rosalind_corr.txt")))
rcs   <- vapply(reads, revc, character(1), USE.NAMES = FALSE)

total <- numeric(length(reads))
for (i in seq_along(reads)) {
  total[i] <- sum(reads == reads[i])
  if (rcs[i] != reads[i]) total[i] <- total[i] + sum(reads == rcs[i])
}

good <- unique(c(reads[total >= 2], rcs[total >= 2])) 
bad  <- reads[total == 1]                             

out <- character(0)
for (b in bad) {
  d <- sapply(good, function(g) sum(utf8ToInt(g) != utf8ToInt(b)))   
  g <- good[which(d == 1)[1]]
  out <- c(out, paste0(b, "->", g))
}

writeLines(out, "E:/rosalind_corr_output.txt")