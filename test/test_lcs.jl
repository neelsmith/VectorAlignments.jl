@testset "Test LCS" begin
    @test lcs("abcf", "bce") == collect("bc")
    @test  lcs("a", "ba") == collect("a")
    @test  lcs("ba", "a") == collect("a")
    @test  lcs("a", "") == []
    
end