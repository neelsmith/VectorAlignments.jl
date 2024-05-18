module VectorAlignments

using Documenter, DocStringExtensions

include("matrix.jl")
include("lcs.jl")
include("scs.jl")
include("alignment.jl")
include("sliders.jl")

export scs, lcs, align
export featurematrix
export slidingwindow

end # module VectorAlignments
