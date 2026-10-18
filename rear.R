lines <- trimws(readLines("E:/rosalind_rear.txt"))
lines <- lines[lines != ""]
perms <- lapply(strsplit(lines, " "), as.integer)
n <- 10


pw  <- 10^(9:0)
enc <- function(M) as.vector(M %*% pw)                                
dec <- function(codes) outer(codes, pw, function(c, p) (c %/% p) %% 10)  

moves <- combn(n, 2)        


expand <- function(codes) {
  M <- dec(codes)
  out <- vector("list", ncol(moves))
  for (m in seq_len(ncol(moves))) {
    idx <- 1:n
    idx[moves[1, m]:moves[2, m]] <- moves[2, m]:moves[1, m]           # đảo đoạn i..j
    out[[m]] <- enc(M[, idx, drop = FALSE])
  }
  unique(unlist(out))
}


bfs_levels <- function(start_code, depth) {
  lv <- list(start_code)
  seen <- start_code
  for (d in seq_len(depth)) {
    nxt <- setdiff(expand(lv[[d]]), seen)
    lv[[d + 1]] <- nxt
    seen <- c(seen, nxt)
  }
  lv
}


A       <- bfs_levels(enc(matrix(0:(n - 1), nrow = 1)), 4)
A_codes <- unlist(A)
A_dist  <- rep(0:4, lengths(A))

rev_distance <- function(p, s) {
  pos <- integer(n)
  pos[s] <- 1:n                                       
  B <- bfs_levels(enc(matrix(pos[p] - 1, nrow = 1)), 5)
  
  best <- Inf
  for (j in 0:5) {
    hit <- match(B[[j + 1]], A_codes)                
    hit <- hit[!is.na(hit)]
    if (length(hit) > 0) best <- min(best, j + min(A_dist[hit]))
  }
  best
}

k <- length(perms) / 2
result <- integer(k)
for (t in seq_len(k)) {
  result[t] <- rev_distance(perms[[2 * t - 1]], perms[[2 * t]])
}

writeLines(paste(result, collapse = " "), "E:/rosalind_rear_output.txt")