lines <- trimws(readLines("E:/rosalind_sort.txt"))
lines <- lines[lines != ""]
p <- as.integer(strsplit(lines[1], " ")[[1]])      
s <- as.integer(strsplit(lines[2], " ")[[1]])      
n <- 10

pw  <- 10^(9:0)
enc <- function(M) as.vector(M %*% pw)
dec <- function(codes) outer(codes, pw, function(c, q) (c %/% q) %% 10)

moves <- combn(n, 2)                              

apply_move <- function(codes, m) {                 
  idx <- 1:n
  idx[moves[1, m]:moves[2, m]] <- moves[2, m]:moves[1, m]
  enc(dec(codes)[, idx, drop = FALSE])
}

expand <- function(codes) {
  unique(unlist(lapply(seq_len(ncol(moves)), function(m) apply_move(codes, m))))
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


back <- function(code, lv, d) {
  mv <- list()
  while (d > 0) {
    for (m in seq_len(ncol(moves))) {
      nxt <- apply_move(code, m)
      if (nxt %in% lv[[d]]) {                      
        mv[[length(mv) + 1]] <- moves[, m]
        code <- nxt
        break
      }
    }
    d <- d - 1
  }
  mv
}

pos <- integer(n)
pos[s] <- 1:n
pp <- pos[p]                                       

A <- bfs_levels(enc(matrix(0:(n - 1), nrow = 1)), 4)    
B <- bfs_levels(enc(matrix(pp - 1, nrow = 1)), 5)       
A_codes <- unlist(A)
A_dist  <- rep(0:4, lengths(A))

best <- Inf; bj <- NA; bM <- NA; bk <- NA
for (j in 0:5) {
  hit <- match(B[[j + 1]], A_codes)
  ok  <- !is.na(hit)
  if (any(ok)) {
    h <- hit[ok]
    w <- which.min(A_dist[h])
    if (j + A_dist[h][w] < best) {
      best <- j + A_dist[h][w]
      bj <- j; bk <- A_dist[h][w]; bM <- A_codes[h][w]
    }
  }
}

movesB <- back(bM, B, bj)                          
movesA <- back(bM, A, bk)                          
path   <- c(rev(movesB), movesA)                   


chk <- p
for (mv in path) chk[mv[1]:mv[2]] <- chk[mv[2]:mv[1]]
stopifnot(identical(chk, s))

out <- c(best, vapply(path, function(mv) paste(mv, collapse = " "), character(1)))
writeLines(as.character(out), "E:/rosalind_sort_output.txt")