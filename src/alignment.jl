"""Align sequences s1 and s2 in a pair of vectors equal in length to the SCS.
First find the SCS of the two sequences, then align each element of s1 an s2 with an element in the SCS.
"""
function alignpair(s1,s2)
	slots = scs(s1, s2)
	s1align = []
	s2align = []

	s1seen = 1
	s2seen = 1
	for (i, item) in enumerate(slots)
		
		if slots[i] == s1[s1seen]
			push!(s1align, s1[s1seen])
			s1seen = s1seen + 1
		else
			push!(s1align, nothing)
		end
		
		if slots[i] == s2[s2seen]
			push!(s2align, s2[s2seen])
			s2seen = s2seen + 1
		else
			push!(s2align, nothing)
		end
		
	end
	s1align, s2align
end


"""Compute the alignment of each sequence in a vector of sequences
to the SCS for the vector of sequences."""
function align(v...)
	maxseq = scs(v...)
	results = []
	for seq in v
		push!(results, alignpair(seq, maxseq)[1])
	end
	results
end