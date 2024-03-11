@testset "Test SCS" begin
    @test scs("abcf", "bce") == collect("abcfe")

   
    @test scs("ab", "ac") == collect("abc")

    @test scs("abcd", "bcde") == collect("abcde")
    @test scs("ac", "abcd") == collect("abcd")
    @test scs("acd", "abc") == collect("abcd")

    @test scs("abd", "cde") == collect("abcde")
    @test scs("abd", "cde", "efg") == collect("abcdefg")
end



@testset "Test custom comparison function with SCS" begin
    a = [0.95, 1.0, 0.9]
    b = [0.92, 0.99, 0.92]
    f = (x,y) -> ≈(x,y; rtol = 0.05)
    @test lcs(a,b; cf = f) == a

    c = [0.92, 0.99, 0.97]
    @test lcs(a,c; cf = f) == [0.95,1.0]
end

@testset "Test custom normalization function with SCS" begin
    a = [0.95, 1.0, 0.9]
    b = [0.92, 0.99, 0.92]
    c = [0.92, 0.99, 0.97]
    @test lcs(a,c; norm = round) == a

    @test lcs(a,c; cf = (x,y) -> ≈(x,y; rtol = 0.05)) == [ 0.95,  1.0]
end
