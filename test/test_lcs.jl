@testset "Test LCS" begin
    @test lcs("abcf", "bce") == collect("bc")
end