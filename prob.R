lines <- trimws(readLines("E:/rosalind_prob.txt"))
lines <- lines[lines != ""]

s <- lines[1]                                       
A <- as.numeric(strsplit(lines[2], " ")[[1]])       

chars <- strsplit(s, "")[[1]]
n_gc  <- sum(chars %in% c("G", "C"))                
n_at  <- length(chars) - n_gc                       

B <- n_gc * log10(A / 2) + n_at * log10((1 - A) / 2)

writeLines(paste(sprintf("%.3f", B), collapse = " "), "E:/rosalind_prob_output.txt")