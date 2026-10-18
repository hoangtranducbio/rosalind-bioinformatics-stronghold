lines <- trimws(readLines("E:/rosalind_nkew.txt"))
lines <- lines[lines != ""]

trees <- lines[seq(1, length(lines), by = 2)]
pairs <- lines[seq(2, length(lines), by = 2)]

tree_dist <- function(nw, x, y) {
  nw <- gsub("\\s", "", nw)
  tokens <- regmatches(nw, gregexpr("[(),;]|[^(),;]+", nw))[[1]]
  
  parent <- integer(0)
  weight <- numeric(0)             
  name   <- character(0)
  stack  <- integer(0)
  last   <- 0
  
  
  split_tok <- function(tk) {
    p <- strsplit(tk, ":", fixed = TRUE)[[1]]
    nm <- if (startsWith(tk, ":")) "" else p[1]
    w  <- if (grepl(":", tk, fixed = TRUE)) as.numeric(p[length(p)]) else 0
    list(name = nm, w = w)
  }
  
  for (tk in tokens) {
    if (tk == "(") {
      id <- length(parent) + 1
      parent[id] <- if (length(stack) > 0) stack[length(stack)] else 0
      weight[id] <- 0
      name[id]   <- ""
      stack <- c(stack, id)
      last  <- 0
    } else if (tk == ")") {
      last  <- stack[length(stack)]
      stack <- stack[-length(stack)]
    } else if (tk == "," || tk == ";") {
      last <- 0
    } else {
      r <- split_tok(tk)
      if (last > 0) {                        
        name[last]   <- r$name
        weight[last] <- r$w
        last <- 0
      } else {                               
        id <- length(parent) + 1
        parent[id] <- stack[length(stack)]
        weight[id] <- r$w
        name[id]   <- r$name
      }
    }
  }
  
  up <- function(v) {
    nodes <- v
    dist  <- 0
    while (parent[v] != 0) {
      dist <- c(dist, dist[length(dist)] + weight[v])
      v <- parent[v]
      nodes <- c(nodes, v)
    }
    list(nodes = nodes, dist = dist)
  }
  
  ux <- up(match(x, name))
  uy <- up(match(y, name))
  common <- ux$nodes[ux$nodes %in% uy$nodes][1]       
  ux$dist[which(ux$nodes == common)] + uy$dist[which(uy$nodes == common)]
}

result <- numeric(length(trees))
for (i in seq_along(trees)) {
  xy <- strsplit(pairs[i], " ")[[1]]
  result[i] <- tree_dist(trees[i], xy[1], xy[2])
}

writeLines(paste(result, collapse = " "), "E:/rosalind_nkew_output.txt")