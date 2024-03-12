

# Parameters and return values


`lcs`, `scs`, `align` and `featurematrix` all accept a variable number of vector parameters.  `lcs` and `scs` always return a single vector. 

```@example params
using VectorAlignments
s1 = split("Now is the time")
s2 = split("Now is not the time")
s3 = split("Now might be the time")
lcs(s1, s2, s3)
```
```@example params
scs(s1, s2, s3)
```

`align` returns a vector of vectors, with one output vector for each input vector. The length of each of the output vectors equals the length of the complete SCS for the input vectors.

```@example params
align(s1, s2, s3)
```

`featurematrix` returns a two-dimensional matrix, with one row for each feature and one column for each input vector.

```@example params
featurematrix(s1, s2, s3)
```

## Order of alignment in gaps

In aligning sequences with different content in the same position in the sequence, the order of parameters is used to order elements in the resulting alignment. For example, in the following comparison, all three sequences match on `d`; the alignment add elements preceding `d` by taking the vectors in the order they are given.  

```@example params
scs("ad", "bd", "cd") 
```

This means that you can control the alignment of gaps by your ordering of parameters.


```@example params
scs("cd", "bd", "ad") 
```

## Optional parameters

`lcs`, `scs`, `align` and `featurematrix` use the Needleman–Wunsch algorithm to align sequences. Its dynamic-programming approach constructs a matrix of scores comparing two lists element by element. `lcs`, `scs`, `align` and `featurematrix` allow optional named parameters for two functions that are applied in this process: 

- `norm`: a function to normalize values before comparing them. The default is to use the unaltered value of the element (`x -> x`).
- `cf`: a function for comparing the elements of the two vectors. The default is to compare for equality (`==`).

### Examples: normalization

The following alignment normalizes characters to lowercase before comparing them, so that `'b'` and `'B'` are aligned. Note that the raw values (before normalization) are retained in the aligned vectors.

```@example params
featurematrix("ab", "Bc", "cd"; norm = lowercase)
```

`lcs` and `scs` follow the order of parameters in selecting a value for their single output vector. Compare the following two examples.


```@example params
scs("ab", "Bc", "cd"; norm = lowercase)   |> join
```

```@example params
scs("aB", "bc", "cd"; norm = lowercase)   |> join
```

### Examples: comparison

In the following example, we compare elements using Julia's `isapprox` function with a value of 0.1 for relative tolerance:


```@example params
a = [0.95, 1.1, 0.98]
b = [0.93, 0.99, 0.96]

f = (x,y) -> ≈(x,y; rtol = 0.1)

featurematrix(a,b; cf = f)
```

Compare this result with an alignment of the same vectors based on normalizing the floating point values by rounding them to integers:

```@example params
featurematrix(a,b; norm = round)
```