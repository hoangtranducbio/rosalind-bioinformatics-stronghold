ids <- trimws(readLines("E:/rosalind_mprt.txt"))
ids <- ids[ids != ""]

out <- character(0)

for (id in ids) {
  acc <- sub("_.*", "", id)
  url <- paste0("https://rest.uniprot.org/uniprotkb/", acc, ".fasta")

  fa  <- readLines(url, warn = FALSE)
  s   <- paste(trimws(fa[-1]), collapse = "")

  m   <- gregexpr("(?=N[^P][ST][^P])", s, perl = TRUE)[[1]]
  pos <- as.integer(m) 

  if (pos[1] != -1) { 
    out <- c(out, id, paste(pos, collapse = " "))
  }
}

cat(out, sep = "\n")
writeClipboard(paste(out, collapse = "\n"))