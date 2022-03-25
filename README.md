# MergeSorted

![CI](https://github.com/takuti/Recommendation.jl/workflows/CI/badge.svg)

Efficiently merge two sorted vectors into one sorted vector in linear time. Provides the `mergesorted` and `mergesorted!` functions.

E.g.

```julia
using MergeSorted

a = sort!(rand(5), order=Base.Reverse)
b = sort!(rand(5), order=Base.Reverse)

c = mergesorted(a,b, order=Base.Reverse)
sort!(vcat(a,b), order=Base.Reverse) == c

d = zeros(10)
mergesorted!(d, a, b, order=Base.Reverse)
sort!(vcat(a,b), order=Base.Reverse) == d
```

MergeSorted can be installed as follows.

```julia
using Pkg; Pkg.add("MergeSorted")
```

