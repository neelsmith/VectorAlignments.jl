"""Align sequences s1 and s2 in a pair of vectors equal in length to the SCS of the two vectors.
First find the SCS of the two sequences, then align each element of s1 an s2 with an element in the SCS.

$(SIGNATURES)
"""
function alignpair(s1, s2; 
	norm = x -> x, 
	cf = (x,y) -> x == y)

	slots = scs(s1, s2)

	s1align = []
	s2align = []
	s1seen = 1
	s2seen = 1

	for item in slots
		slotsval = norm(item)
		if s1seen <= length(s1)
			s1val = norm(s1[s1seen])
			if cf(slotsval, s1val)
				push!(s1align, s1[s1seen])
				s1seen = s1seen + 1
			else
				push!(s1align, nothing)
			end
		else
			push!(s1align, nothing)
		end

		if s2seen <= length(s2) 
			s2val = norm(s2[s2seen])
			
			if cf(slotsval, s2val)
				push!(s2align, s2[s2seen])
				s2seen = s2seen + 1
			else
				push!(s2align, nothing)
			end
		else
			push!(s2align, nothing)
		end
	end
	s1align, s2align
end


"""Align each of the vectors in the parameter list to the comprehensive SCS for all of the parameter vectors.


# Examples
```jldoctest
julia> align([1,3,5], [1,2,3])
2-element Vector{Any}:
 Any[1, nothing, 3, 5]
 Any[1, 2, 3, nothing]
```

$(SIGNATURES)
"""
function align(v... ; norm = x -> x, cf = (x,y) -> x == y)
	maxseq = scs(v...)
	results = []
	for seq in v
		push!(results, alignpair(seq, maxseq, norm = norm, cf = cf)[1])
	end
	results
end

