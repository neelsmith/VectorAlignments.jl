@testset "Test sliding window" begin
    intv = collect(1:5)
    @test slidingwindow(intv) ==  [[1, 2], [2, 3], [3, 4], [4, 5]]

    @test slidingwindow(intv; pad = true )  == [[nothing, 1], [1, 2], [2, 3],  [3, 4], [4, 5], [5, nothing]]

    @test slidingwindow(intv; n = 4 )  == [ [1, 2, 3, 4],
    [2, 3, 4, 5]]

    stringv = split("abcd","")
    @test slidingwindow(stringv) == [["a", "b"],["b", "c"], ["c", "d"]]

    charv = collect("abcd")
    @test slidingwindow(charv)==  [['a', 'b'], ['b', 'c'], ['c', 'd']]

end