lines <- trimws(readLines("E:/rosalind_nwck.txt"))
lines <- lines[lines != ""]

trees <- lines[seq(1, length(lines), by = 2)]  
pairs <- lines[seq(2, length(lines), by = 2)]   

tree_dist <- function(nw, x, y) {
  nw <- gsub("\\s", "", nw)                                         
  tokens <- regmatches(nw, gregexpr("[(),;]|[^(),;]+", nw))[[1]]    
  
  parent <- integer(0)
  name   <- character(0)
  stack  <- integer(0)
  last   <- 0                                   
  
  for (tk in tokens) {
    if (tk == "(") {
      id <- length(parent) + 1
      parent[id] <- if (length(stack) > 0) stack[length(stack)] else 0
      name[id]   <- ""
      stack <- c(stack, id)
      last  <- 0
    } else if (tk == ")") {
      last  <- stack[length(stack)]
      stack <- stack[-length(stack)]
    } else if (tk == "," || tk == ";") {
      last <- 0
    } else {                                   
      if (last > 0) {
        name[last] <- tk                        
        last <- 0
      } else {
        id <- length(parent) + 1                
        parent[id] <- stack[length(stack)]
        name[id]   <- tk
      }
    }
  }
  
  up <- function(v) {                          
    path <- v
    while (parent[v] != 0) {
      v <- parent[v]
      path <- c(path, v)
    }
    path
  }
  
  px <- up(match(x, name))
  py <- up(match(y, name))
  common <- px[px %in% py][1]                   
  (which(px == common) - 1) + (which(py == common) - 1)
}

result <- integer(length(trees))
for (i in seq_along(trees)) {
  xy <- strsplit(pairs[i], " ")[[1]]
  result[i] <- tree_dist(trees[i], xy[1], xy[2])
}

writeLines(paste(result, collapse = " "), "E:/rosalind_nwck_output.txt")