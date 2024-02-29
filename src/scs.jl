


"""Find shortest common supersequence for a vector of sequences."""
function scs(v...)
	if length(v) < 2
		v
	else 
		scs1 = scspair(v[1], v[2])
        length(v) == 2 ? scs1 : scs(scs1, v[3:end]...)
	end
end


"""Find shortest common supersequence for two sequences.
Walk back through a matrix of alignment scores to recover
all items in sequences `a` or `b`.
"""
function scspair(a, b)
	m = alignmentmemo(a,b)
    x,y = size(m)

    keepers = []
    while x > 1 && y > 1
        if m[x, y] == m[x-1, y]
            x -= 1
            push!(keepers, a[x])
        elseif m[x, y] == m[x, y-1]
            y -= 1
            push!(keepers, b[y])
        else
            @assert a[x-1] == b[y-1]
            push!(keepers, a[x-1])
            x -= 1
            y -= 1
        end
    end
    keepers |> reverse
end


