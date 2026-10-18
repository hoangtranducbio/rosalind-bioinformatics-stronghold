lines = trimws(readLines("E:/rosalind_lexf.txt"))
lines = lines[lines != ""]
alphabet = sort(strsplit(lines[1], " ")[[1]])
n = as.integer(lines[2])
result = alphabet 
for (i in seq_len(n-1)) {
  result = as.vector(t(outer(result, alphabet, paste0)))
}
writeClipboard(paste(result, collapse = "\n"))