# VectorAlignments


## Overview 

Compare and align vectors of any type. Find longest common subsequence, shortest common supersequence, and align elements in parallel sequences.

```@example basic
using VectorAlignments
```

Longest common subsequence:

```@example basic
lcs("ab", "abc")
```


Shortest common supersequence:

```@example basic
scs("ab", "abc")
```



Align elements in parallel sequences:

```@example basic
align("bc", "abc")
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


### Order of alignment in gaps

In aligning sequences with different content in the same position in the sequence, the order of parameters is used to order elements in the resulting alignment. See 


### Numbers of parameters