# VectorAlignments


## Overview 

Compare and align vectors with contents of any type: find longest common subsequence, shortest common supersequence, and align elements in parallel sequences.

```@example basic
using VectorAlignments
```

Longest common subsequence:

```@example basic
lcs("abc", "abd")
```


Shortest common supersequence:

```@example basic
scs("abc", "abd")
```



Align elements in parallel sequences:

```@example basic
align("abc", "abd")
```


## A few details


### Types

The vectors to compare can contain elements of any type.

```@example basic
scs([1,3,5], [1,2,3])
```

Since strings are treated as vectors of characters, the return values of `scs` and `lcs` will be vectors of characters: you'll have to turn them into strings yourself if you want a String value.

```@example basic
scs("bc", "abc") |> join
```

### Numbers of parameters and return values

`lcs`, `scs` and `align` all accept a variable number of vector parameters.  `lcs` and `scs` always return a single vector. 

```@example basic
s1 = split("Now is the time")
s2 = split("Now is not the time")
s3 = split("Now might be the time")
lcs(s1, s2, s3)
```
```@example basic
scs(s1, s2, s3)
```


`align` returns a vector of vectors, with one output vector for each input vector. The length of each of the output vectors equals the length of the complete SCS for the input vectors.

```@example basic
align(s1, s2, s3)
```

### Order of alignment in gaps

In aligning sequences with different content in the same position in the sequence, the order of parameters is used to order elements in the resulting alignment. For example, the following comparison of three sequences matches on `d`, and includes elements preceding `d` by taking the vectors in the order they are given.  

```@example basic
scs("ad", "bd", "cd") 
```

This means that you can control the alignment of gaps by your ordering of parameters.


```@example basic
scs("cd", "bd", "ad") 
```
