# Rosalind – Bioinformatics Stronghold (R)

Solutions to 50 problems from the **Bioinformatics Stronghold** section of
[Rosalind](https://rosalind.info/problems/locations/), written in **R 4.6.1**.

Rosalind profile: https://rosalind.info/users/hoang.tranduc.bio/

## How to run

1. Download the dataset for a problem from Rosalind (`rosalind_xxxx.txt`).
2. Open the matching `.R` file and edit the input path at the top
   (the scripts use `E:/rosalind_xxxx.txt`).
3. Run the script. The answer is written to `rosalind_xxxx_output.txt`.

## Problems

| ID | Problem | File |
|---|---|---|
| DNA | Counting DNA Nucleotides | [dna.R](dna.R) |
| RNA | Transcribing DNA into RNA | [rna.R](rna.R) |
| REVC | Complementing a Strand of DNA | [revc.R](revc.R) |
| FIB | Rabbits and Recurrence Relations | [fib.R](fib.R) |
| GC | Computing GC Content | [gc.R](gc.R) |
| HAMM | Counting Point Mutations | [hamm.R](hamm.R) |
| IPRB | Mendel's First Law | [iprb.R](iprb.R) |
| PROT | Translating RNA into Protein | [prot.R](prot.R) |
| SUBS | Finding a Motif in DNA | [subs.R](subs.R) |
| CONS | Consensus and Profile | [cons.R](cons.R) |
| FIBD | Mortal Fibonacci Rabbits | [fibd.R](fibd.R) |
| GRPH | Overlap Graphs | [grph.R](grph.R) |
| IEV | Calculating Expected Offspring | [iev.R](iev.R) |
| LCSM | Finding a Shared Motif | [lcsm.R](lcsm.R) |
| LIA | Independent Alleles | [lia.R](lia.R) |
| MPRT | Finding a Protein Motif | [mprt.R](mprt.R) |
| MRNA | Inferring mRNA from Protein | [mrna.R](mrna.R) |
| ORF | Open Reading Frames | [orf.R](orf.R) |
| PERM | Enumerating Gene Orders | [perm.R](perm.R) |
| PRTM | Calculating Protein Mass | [prtm.R](prtm.R) |
| REVP | Locating Restriction Sites | [revp.R](revp.R) |
| SPLC | RNA Splicing | [splc.R](splc.R) |
| LEXF | Enumerating k-mers Lexicographically | [lexf.R](lexf.R) |
| LGIS | Longest Increasing Subsequence | [lgis.R](lgis.R) |
| LONG | Genome Assembly as Shortest Superstring | [long.R](long.R) |
| PMCH | Perfect Matchings and RNA Secondary Structures | [pmch.R](pmch.R) |
| PPER | Partial Permutations | [pper.R](pper.R) |
| PROB | Introduction to Random Strings | [prob.R](prob.R) |
| SIGN | Enumerating Oriented Gene Orderings | [sign.R](sign.R) |
| SSEQ | Finding a Spliced Motif | [sseq.R](sseq.R) |
| TRAN | Transitions and Transversions | [tran.R](tran.R) |
| TREE | Completing a Tree | [tree.R](tree.R) |
| CAT | Catalan Numbers and RNA Secondary Structures | [cat.R](cat.R) |
| CORR | Error Correction in Reads | [corr.R](corr.R) |
| INOD | Counting Phylogenetic Ancestors | [inod.R](inod.R) |
| KMER | k-Mer Composition | [kmer.R](kmer.R) |
| KMP | Speeding Up Motif Finding | [kmp.R](kmp.R) |
| LCSQ | Finding a Shared Spliced Motif | [lcsq.R](lcsq.R) |
| LEXV | Ordering Strings of Varying Length Lexicographically | [lexv.R](lexv.R) |
| MMCH | Maximum Matchings and RNA Secondary Structures | [mmch.R](mmch.R) |
| MOTZ | Motzkin Numbers and RNA Secondary Structures | [motz.R](motz.R) |
| NWCK | Distances in Trees | [nwck.R](nwck.R) |
| PDST | Creating a Distance Matrix | [pdst.R](pdst.R) |
| REAR | Reversal Distance | [rear.R](rear.R) |
| RSTR | Matching Random Motifs | [rstr.R](rstr.R) |
| SORT | Sorting by Reversals | [sort.R](sort.R) |
| EDIT | Edit Distance | [edit.R](edit.R) |
| EDTA | Edit Distance Alignment | [edta.R](edta.R) |
| CTEA | Counting Optimal Alignments | [ctea.R](ctea.R) |
| NKEW | Newick Format with Edge Weights | [nkew.R](nkew.R) |

## Notes

- `mprt.R` downloads protein sequences from UniProt, so it needs an internet connection.
- Problems with very large exact answers (`pmch.R`, `mmch.R`) use arbitrary-precision arithmetic.
- Problems asking for a result modulo a large number (`mrna.R`, `pper.R`, `cat.R`, `motz.R`, `ctea.R`) reduce after every step to avoid overflow.
