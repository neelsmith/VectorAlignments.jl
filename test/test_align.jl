@testset "Test alignment" begin
    @test_broken align("abcf", "bce") == (
        ['a','b', 'c', nothing, 'f'],
        [nothing, 'b', 'c', 'e', nothing]
    )


    
end