# MergeSorted

[![CI](https://github.com/vvjn/MergeSorted.jl/workflows/CI/badge.svg)](https://github.com/vvjn/MergeSorted.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/vvjn/MergeSorted.jl/branch/master/graph/badge.svg?token=meJ4tAxlLo)](https://codecov.io/gh/vvjn/MergeSorted.jl)

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

