@testset "Test alignment" begin
    
    @test align("abcf", "bce") == [
        ['a', 'b', 'c', 'f', nothing],
        [nothing, 'b', 'c', nothing, 'e']
    ]

    @test align("ab", "bc") == [
        ['a', 'b', nothing],
        [nothing, 'b', 'c']
    ]

    
end