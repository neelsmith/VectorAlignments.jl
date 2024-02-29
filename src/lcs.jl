"""Find longest common subsequence for two sequences.
Walk back through a matrix of alignment scores to find all items
that are common to sequences `a` and `b`.
"""
function lcspair(a, b)
	m = alignmentmemo(a,b)
    x,y = size(m)

    keepers = []
    while x > 1 && y > 1
        if m[x, y] == m[x-1, y]
            x -= 1
            
        elseif m[x, y] == m[x, y-1]
            y -= 1
            
        else
            @assert a[x-1] == b[y-1]
            push!(keepers, a[x-1])
            x -= 1
            y -= 1
        end
    end
    keepers |> reverse
end


"""Find longest common subsequence for a vector of sequences."""
function lcs(v...)
	if length(v) < 2
		v
	else 
		lcs1 = lcspair(v[1], v[2])
        length(v) == 2 ? lcs1 : lcs(lcs1, v[3:end]...)
	end
end