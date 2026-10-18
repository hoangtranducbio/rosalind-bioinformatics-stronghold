parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

seqs <- unname(parse_fasta(readLines("E:/rosalind_sseq.txt")))

s  <- strsplit(seqs[1], "")[[1]]     
tc <- strsplit(seqs[2], "")[[1]]     

idx <- integer(length(tc))           
j <- 1                               

for (i in seq_along(s)) {
  if (j > length(tc)) break          
  if (s[i] == tc[j]) {
    idx[j] <- i
    j <- j + 1
  }
}

writeLines(paste(idx, collapse = " "), "E:/rosalind_sseq_output.txt")