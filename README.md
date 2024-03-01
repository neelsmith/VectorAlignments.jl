# VectorAlignments.jl

Compare vectors for shortest common supersequence, longest common subsequence, and alignments.

## Overview

```
julia> using VectorAlignments
julia> lcs("ab", "abc")

2-element Vector{Any}:
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)

julia> scs("ab", "abc")

3-element Vector{Any}:
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'c': ASCII/Unicode U+0063 (category Ll: Letter, lowercase)

julia> align("bc","abc")
2-element Vector{Any}:
 Any[nothing, 'b', 'c']
 Any['a', 'b', 'c']
```