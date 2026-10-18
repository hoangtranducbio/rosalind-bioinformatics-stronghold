parse_fasta <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  mapply(function(s, e) paste(lines[(s + 1):e], collapse = ""),
         header_idx, end_idx)
}

seqs    <- unname(parse_fasta(readLines("E:/rosalind_splc.txt")))
s       <- seqs[1]
introns <- seqs[-1]


for (it in introns) {
  s <- gsub(it, "", s, fixed = TRUE)
}


bases  <- c("T", "C", "A", "G")
grid   <- expand.grid(b3 = bases, b2 = bases, b1 = bases)
codons <- paste0(grid$b1, grid$b2, grid$b3)
aa     <- strsplit("FFLLSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG", "")[[1]]
names(aa) <- codons


starts <- seq(1, nchar(s) - 2, by = 3)
prot   <- aa[substring(s, starts, starts + 2)]
prot   <- prot[cumsum(prot == "*") == 0]    

result <- paste(unname(prot), collapse = "")
writeLines(result, "E:/rosalind_splc_output.txt")