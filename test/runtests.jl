using MergeSorted
import Test: @test, @testset

@testset "Correctness" begin
    for k in [1,1,2,2,3,3,100,1000]
        a = sort!(rand(k))
        b = sort!(rand(k))
        c = zeros(2*k)
        @test sort!(vcat(a,b)) == mergesorted(a,b)
        @test sort!(vcat(a,b)) == mergesorted!(c,a,b)
    
        a = sort!(rand(k), order=Base.Reverse)
        b = sort!(rand(k), order=Base.Reverse)
        c = zeros(2*k)
        @test sort!(vcat(a,b), order=Base.Reverse) == mergesorted(a,b, order=Base.Reverse)
        @test sort!(vcat(a,b), order=Base.Reverse) == mergesorted!(c,a,b, order=Base.Reverse)
    end
end
