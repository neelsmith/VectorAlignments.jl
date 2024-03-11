@testset "Test LCS" begin
    @test lcs("abcf", "bce") == collect("bc")
    @test  lcs("a", "ba") == collect("a")
    @test  lcs("ba", "a") == collect("a")
    @test  lcs("a", "") == []
    @test lcs("abcf", "bce", "cdef") == collect("c")
    
end

@testset "Test custom comparison function with LCS" begin
    a = [0.95, 1.0, 0.9]
    b = [0.92, 0.99, 0.92]
    f = (x,y) -> ≈(x,y; rtol = 0.05)
    @test lcs(a,b; cf = f) == [0.95, 1.0, 0.9]

    c = [0.92, 0.99, 0.97]
    @test lcs(a,c; cf = f) == [0.95, 1.0]
end

@testset "Test custom normalization function with LCS" begin
    a = [0.95, 1.0, 0.9]
    b = [0.92, 0.99, 0.92]
    c = [0.92, 0.99, 0.97]
    @test lcs(a,c; norm = round) == a
end