@testset "Test SCS" begin
    @test_broken scs("abcf", "bce") == collect("abcef")


    @test_broken scs("ab", "ac") == collect("abc")

    @test_broken scs("abcd", "bcde") == collect("abcde")

    
    @test scs("ac", "abcd") == collect("abcd")
    @test scs("acd", "abc") == collect("abcd")
end