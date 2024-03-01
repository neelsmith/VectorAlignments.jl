"""Create a matrix scoring the alignment of two sequences, as used in
Needleman-Wunsch algorithm to solve longest common subsequence with dynamic programming.
"""
function alignmentmemo(a, b)
    lengths = zeros(Int, length(a) + 1, length(b) + 1)
    for (i, x) in enumerate(a)
        for (j, y) in enumerate(b)
            @debug("At $(i)/$(j): $(x) and $(y)")
            if x == y
                lengths[i+1, j+1] = lengths[i, j] + 1
            else
                lengths[i+1, j+1] = max(lengths[i+1, j], lengths[i, j+1])
            end
        end
    end
    lengths
end