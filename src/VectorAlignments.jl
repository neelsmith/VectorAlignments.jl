module VectorAlignments

using Documenter, DocStringExtensions



include("matrix.jl")
include("lcs.jl")
include("scs.jl")
include("alignment.jl")


export scs, lcs, align

end # module VectorAlignments
