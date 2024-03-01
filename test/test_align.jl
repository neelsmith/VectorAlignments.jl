@testset "Test alignment" begin

    ## Need to test array size before indexing!
    @test_broken align("abcf", "bce") == (
        ['a','b', 'c', nothing, 'f'],
        [nothing, 'b', 'c', 'e', nothing]
    )

    # align("ab", "bc")

    
end