@testset "Test SCS" begin
    @test_broken scs("abcf", "bce") == collect("abcef")
end