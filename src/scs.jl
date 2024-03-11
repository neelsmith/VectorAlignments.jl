"""Find the shortest common supersequence for a vector of sequences.


# Examples
```jldoctest
julia> scs([1,3,5], [1,2,3])
4-element Vector{Any}:
 1
 2
 3
 5
```
$(SIGNATURES)
"""
function scs(v...;  norm = x -> x, cf = (x,y) -> x == y)
	if length(v) < 2
		v
	else 
		scs1 = scspair(v[1], v[2]; norm = norm, cf = cf)
        length(v) == 2 ? scs1 : scs(scs1, v[3:end]...; norm = norm, cf = cf)
	end
end

"""
Find the shortest common supersequence for two sequences using dynamic programmning. First compute the memoizing matrix of scores comparing a and b, then walk back through the matrix to find all items in either sequence.

$(SIGNATURES)    
"""
function scspair(a, b; norm = x -> x, cf = (x,y) -> x == y )
	m = alignmentmemo(a,b, norm = norm, cf = cf)

    x,y = size(m)

    keepers = []
    while x > 1 && y > 1
        @debug("Unwind memo at $(x), $(y)")
        
        # Rows win in case of a tie:
        # this is equivalent to giving `a` priority over `b`.
        if m[x, y] == m[x, y-1]
            @debug("Matched on row above")
            y -= 1
            push!(keepers, b[y])

        elseif m[x, y] == m[x-1, y]
            @debug("Matched on column to left")
            x -= 1
            push!(keepers, a[x])

        else
            @assert cf(norm(a[x-1]), norm(b[y-1]))
            @debug("Matching chars $(a[x-1])")
            push!(keepers, a[x-1])
            x -= 1
            y -= 1
        end
       
    end
    @debug("At end with x/y $(x), $(y)")
    while y > 1
        y = y -1
        push!(keepers, b[y])
    end
    while x > 1
        x = x - 1
        push!(keepers, a[x])
    end
    
    keepers |> reverse
end


