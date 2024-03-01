# VectorAlignments


## Overview 

Compare and align vectors of any type. Find longest common subsequence, shortest common supersequence, and align elements in parallel sequences.


### Longest common subsequence

```@example basic
using VectorAlignments
lcs("ab", "abc")
```


### Shortest common supersequence

```@example basic
scs("ab", "abc")
```



### Align elements in parallel sequences

```@example basic
align("bc", "abc")
```
