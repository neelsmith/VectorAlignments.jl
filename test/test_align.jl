@testset "Test alignment" begin
    
    @test align("abcf", "bce") == [
        ['a','b', 'c', nothing, 'f'],
        [nothing, 'b', 'c', 'e', nothing]
    ]

    @test align("ab", "bc") == [
        ['a', 'b', nothing],
        [nothing, 'b', 'c']
    ]

    
end