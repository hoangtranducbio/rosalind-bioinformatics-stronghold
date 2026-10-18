lines <- trimws(readLines("E:/rosalind_subs.txt"))
lines <- lines[lines != ""]

s <- lines[1]
t_str <- lines[2]          

m <- nchar(t_str)
starts <- seq_len(nchar(s) - m + 1)         

hits <- starts[substring(s, starts, starts + m - 1) == t_str]

cat(hits, "\n")