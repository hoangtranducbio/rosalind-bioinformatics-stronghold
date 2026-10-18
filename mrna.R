s <- paste(trimws(readLines("E:/rosalind_mrna.txt")), collapse = "")

# bảng đếm số codon của mỗi amino acid
aa  <- strsplit("FFLLSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG", "")[[1]]
tab <- table(aa)

residues <- strsplit(s, "")[[1]]
counts   <- as.numeric(tab[residues])    # số codon của từng amino acid trong protein

result <- 3                              # số cách chọn codon dừng
for (k in counts) {
  result <- (result * k) %% 1000000      # nhân rồi lấy dư ngay mỗi bước
}

cat(result, "\n", sep = "")
writeClipboard(as.character(result))