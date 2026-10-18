lines = trimws(readLines("E:/rosalind_hamm.txt"))
lines = lines[lines != ""]

s1 = strsplit(lines[1], "")[[1]]
s2 = strsplit(lines[2], "")[[1]]

print(sum(s1 != s2))