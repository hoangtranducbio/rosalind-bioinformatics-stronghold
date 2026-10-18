s <- paste(trimws(readLines("E:/rosalind_prot.txt")), collapse = "")

bases  <- c("U", "C", "A", "G")
grid   <- expand.grid(b3 = bases, b2 = bases, b1 = bases)
codons <- paste0(grid$b1, grid$b2, grid$b3)
aa     <- strsplit("FFLLSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG", "")[[1]]
names(aa) <- codons

starts <- seq(1, nchar(s) - 2, by = 3)
cod    <- substring(s, starts, starts + 2)

prot <- character(0)
for (cd in cod) {
  a <- aa[[cd]]              # [[ ]] lấy giá trị thuần, không kèm tên
  if (a == "*") break        # gặp codon dừng thì thoát
  prot <- c(prot, a)
}

result <- paste(prot, collapse = "")