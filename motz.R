lines <- trimws(readLines("E:/rosalind_motz.txt"))
lines <- lines[lines != ""]
s <- strsplit(paste(lines[!startsWith(lines, ">")], collapse = ""), "")[[1]]
n <- length(s)

MOD  <- 1000000
comp <- c(A = "U", U = "A", C = "G", G = "C")

D <- matrix(0, nrow = n + 2, ncol = n + 2)
for (i in 1:(n + 1)) D[i, i] <- 1            

for (L in 1:n) {                               
  for (i in 1:(n - L + 1)) {
    j <- i + L - 1
    total <- D[i + 1, j + 1]                    
    for (k in seq_len(j - i) + i) {            
      if (comp[[s[i]]] == s[k]) {
        total <- (total + D[i + 1, k] * D[k + 1, j + 1]) %% MOD
      }
    }
    D[i, j + 1] <- total %% MOD
  }
}

result <- D[1, n + 1]