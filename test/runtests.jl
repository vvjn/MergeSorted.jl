using MergeSorted
import Test: @test, @testset

@testset "Output" begin
    a = sort!(rand(3))
    b = sort!(rand(3))
    c = zeros(6)
    d = mergesorted!(c, a, b)
    e = mergesorted(a,b)
    @test d === c
    @test size(d) == size(e)
end

@testset "Correctness" begin
    for k in [0,1,2,3,4,10,100,1000]
        for d in [0,1,2,3]
            a = sort!(rand(k))
            b = sort!(rand(k+d))
            c = zeros(length(a) + length(b))
            @test sort!(vcat(a,b)) == mergesorted(a,b)
            @test sort!(vcat(a,b)) == mergesorted!(c,a,b)

            a = sort!(rand(k), order=Base.Reverse)
            b = sort!(rand(k+d), order=Base.Reverse)
            c = zeros(length(a) + length(b))
            @test sort!(vcat(a,b), order=Base.Reverse) == mergesorted(a,b, order=Base.Reverse)
            @test sort!(vcat(a,b), order=Base.Reverse) == mergesorted!(c,a,b, order=Base.Reverse)
        end
    end
end
