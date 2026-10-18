parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

revc <- function(x) {
  chartr("ACGT", "TGCA", paste(rev(strsplit(x, "")[[1]]), collapse = ""))
}

s <- unname(parse_fasta(readLines("E:/rosalind_revp.txt")))[1]
n <- nchar(s)

out <- character(0)
for (len in seq(4, 12, by = 2)) {
  if (len > n) break                         
  for (i in 1:(n - len + 1)) {
    sub <- substr(s, i, i + len - 1)   
    if (sub == revc(sub)) {
      out <- c(out, paste(i, len))
    }
  }
}

writeLines(out, "E:/rosalind_revp_output.txt")