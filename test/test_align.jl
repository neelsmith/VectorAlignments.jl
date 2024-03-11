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

@testset "Test custom comparison function with alignment" begin
    a = [0.95, 1.0, 0.9]
    b = [0.92, 0.99, 0.92]
    f = (x,y) -> ≈(x,y; rtol = 0.05)
    @test align(a,b; cf = f) ==[a,b]

    c = [0.92, 0.99, 0.97]
    @test align(a,c; cf = f) == [
        [0.95, 1.0, 0.9, nothing],
        [0.92, 0.99, nothing, 0.97]
    ]
end

@testset "Test custom normalization function with LCS" begin
    a = "abc"
    b = "BCD"
    @test align(a,b; norm = uppercase) == [
        ['a', 'b', 'c', nothing], [nothing, 'B', 'C', 'D']
    ]
end