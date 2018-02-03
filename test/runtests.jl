using MergeSorted
using Base.Test

function test1()
    a = sort!(rand(1000))
    b = sort!(rand(1000))
    @test sort!(vcat(a,b)) == mergesorted(a,b)

    a = sort!(rand(1000), order=Base.Reverse)
    b = sort!(rand(1000), order=Base.Reverse)
    @test sort!(vcat(a,b), order=Base.Reverse) == mergesorted(a,b, order=Base.Reverse)
end

test1()
