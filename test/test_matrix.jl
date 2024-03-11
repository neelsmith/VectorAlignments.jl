@testset "Test memoizing" begin
    s1 = "abe"
    s2 =  "abcd"
    expected = [
        0  0  0  0  0
        0  1  1  1  1
        0  1  2  2  2
        0  1  2  2  2
    ]
    @test VectorAlignments.alignmentmemo(s1, s2) == expected


    @test VectorAlignments.alignmentmemo("a","") == [0 ; 0;;  ]

    @test VectorAlignments.alignmentmemo("a","a") == [0 0 ; 0 1]

    @test VectorAlignments.alignmentmemo("ab", "a") ==  [ 0 0; 0 1; 0 1]
    @test VectorAlignments.alignmentmemo("a", "ab") == [ 0  0  0 ; 0  1  1]
    @test VectorAlignments.alignmentmemo("a", "ba") == [0  0  0; 0  0  1]
end