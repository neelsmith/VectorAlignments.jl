@testset "Test SCS" begin
    @test scs("abcf", "bce") == collect("abcef")


    # change this to default to prioritizing s1,
    # and maybe to allow selection of priority by s1 or s2
    @test_broken scs("ab", "ac") == collect("abc")

    @test scs("abcd", "bcde") == collect("abcde")
    @test scs("ac", "abcd") == collect("abcd")
    @test scs("acd", "abc") == collect("abcd")
end