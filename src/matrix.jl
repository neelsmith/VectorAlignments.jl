"""Create a matrix scoring the alignment of two sequences, as used in the Needleman-Wunsch algorithm to solve longest common subsequence with dynamic programming.

$(SIGNATURES)
"""
function alignmentmemo(a, b)
    scores = zeros(Int, length(a) + 1, length(b) + 1)
    for (i, x) in enumerate(a)
        for (j, y) in enumerate(b)
            if x == y
                scores[i+1, j+1] = scores[i, j] + 1
            else
                scores[i+1, j+1] = max(scores[i+1, j], scores[i, j+1])
            end
        end
    end
    scores
end