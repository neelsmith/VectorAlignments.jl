# VectorAlignments



Compare and align vectors with contents of any type: find longest common subsequence, shortest common supersequence, and align elements in parallel sequences.


## Overview 

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



Align elements in parallel sequences (return value is a Vector of Vectors):

```@example basic
align("abc", "abd")
```

Align elements in parallel sequences (return value is a two-dimensional matrix):

```@example basic
featurematrix("abc", "abd")
```

### Types

The vectors to compare can contain elements of any type.

```@example basic
scs([1,3,5], [1,2,3])
```

Since strings are treated as vectors of characters, the return values of `scs` and `lcs` will be vectors of characters: you'll have to turn them into strings yourself if you want a String value.

```@example basic
scs("bc", "abc") |> join
```

