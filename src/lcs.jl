"""Find the longest common subsequence for two sequences using dynamic programmning. First compute the memoizing matrix of scores comparing a and b, then walk back through the matrix to find all items that are common to both sequences.

$(SIGNATURES)
"""
function lcspair(a, b; norm = x -> x, cf = (x,y) -> x == y )
	m = alignmentmemo(a,b; norm = norm, cf = cf)
    x,y = size(m)

    keepers = []
    while x > 1 && y > 1
        if m[x, y] == m[x-1, y]
            x -= 1
            
        elseif m[x, y] == m[x, y-1]
            y -= 1
            
        else
            @assert cf(norm(a[x-1]),norm(b[y-1]))
            push!(keepers, a[x-1])
            x -= 1
            y -= 1
        end
    end
    keepers |> reverse
end


"""Find the longest common subsequence for a vector of sequences.

# Examples
```jldoctest
julia> lcs([1,3,5], [1,2,3])
2-element Vector{Any}:
 1
 3
```

$(SIGNATURES)
"""
function lcs(v...; 
    norm = x -> x, 
    cf = (x,y) -> x == y)

	if length(v) < 2
		v
	else 
		lcs1 = lcspair(v[1], v[2]; norm = norm, cf = cf)
        length(v) == 2 ? lcs1 : lcs(lcs1, v[3:end]...; norm = norm, cf = cf)
	end
end