permute = function(item) {
  if (length(item) == 1) return(list(item))
  result = list()
  for (i in seq_along(item)) {
    rest = item[-i]
    for (p in permute(rest)){
      result[[length(result)+1]] = c(item[i],p)
    }
  }
  result
}
perm = permute(1:5)
line= c(length(perm),
        sapply(perm, paste, collapse = " "))
writeClipboard(paste(line, collapse = "\n"))