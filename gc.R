parse_fasta_full <- function(lines) {
  lines <- trimws(lines)
  lines <- lines[lines != ""]
  
  header_idx <- which(startsWith(lines, ">"))
  end_idx <- c(header_idx[-1] - 1, length(lines))
  

  ids <- sub("^>", "", lines[header_idx])
  

  seqs <- mapply(function(s, e) {
    paste(lines[(s + 1):e], collapse = "")
  }, header_idx, end_idx, USE.NAMES = FALSE)
  
  list(ids = ids, seqs = seqs)
}


raw_lines <- readLines("E:/rosalind_gc.txt")
parsed <- parse_fasta_full(raw_lines)

ids <- parsed$ids
seqs <- parsed$seqs


calculate_gc <- function(dna_string) {
  chars <- strsplit(dna_string, "")[[1]]
  total_len <- length(chars)
  if (total_len == 0) return(0)
  

  gc_count <- sum(chars == 'C' | chars == 'G')
  

  return((gc_count / total_len) * 100)
}

gc_percentages <- sapply(seqs, calculate_gc)


max_idx <- which.max(gc_percentages)
best_id <- ids[max_idx]
best_gc <- gc_percentages[max_idx]


output_result <- sprintf("%s\n%.6f", best_id, best_gc)
cat(output_result, "\n")
writeClipboard(output_result)