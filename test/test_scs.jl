@testset "Test SCS" begin
    @test scs("abcf", "bce") == collect("abcfe")

   
    @test scs("ab", "ac") == collect("abc")

    @test scs("abcd", "bcde") == collect("abcde")
    @test scs("ac", "abcd") == collect("abcd")
    @test scs("acd", "abc") == collect("abcd")

    @test scs("abd", "cde") == collect("abcde")
    @test scs("abd", "cde", "efg") == collect("abcdefg")
end