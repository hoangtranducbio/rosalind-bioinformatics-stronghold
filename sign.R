n <- as.integer(trimws(readLines("E:/rosalind_sign.txt"))[1])

permute <- function(item) {
  if (length(item) == 1) return(list(item))
  result <- list()
  for (i in seq_along(item)) {
    rest <- item[-i]
    for (p in permute(rest)) {
      result[[length(result) + 1]] <- c(item[i], p)
    }
  }
  result                                 
}

perms <- permute(1:n)

sg <- as.matrix(expand.grid(rep(list(c(1, -1)), n)))

total <- length(perms) * nrow(sg)
out <- character(total)                   
idx <- 0

for (p in perms) {
  for (r in seq_len(nrow(sg))) {
    idx <- idx + 1
    out[idx] <- paste(p * sg[r, ], collapse = " ")
  }
}

writeLines(c(total, out), "E:/rosalind_sign_output.txt")